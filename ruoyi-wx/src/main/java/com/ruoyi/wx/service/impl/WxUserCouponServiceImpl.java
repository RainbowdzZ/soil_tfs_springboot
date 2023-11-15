package com.ruoyi.wx.service.impl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.wx.domain.entity.WxCoupon;
import com.ruoyi.wx.domain.vo.CouponVO;
import com.ruoyi.wx.domain.vo.IssuingCouponsVO;
import com.ruoyi.wx.enums.CouponConstant;
import com.ruoyi.wx.enums.CouponStatusContant;
import com.ruoyi.wx.mapper.WxCouponMapper;
import com.ruoyi.wx.service.IWxCouponService;
import com.ruoyi.wx.utils.UserContext;
import org.springframework.aop.framework.AopContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wx.mapper.WxUserCouponMapper;
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.service.IWxUserCouponService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 优惠券历史Service业务层处理
 * 
 * @author xqb
 * @date 2023-11-06
 */
@Service
public class WxUserCouponServiceImpl extends ServiceImpl<WxUserCouponMapper,WxUserCoupon> implements IWxUserCouponService
{
    @Autowired
    private WxUserCouponMapper wxUserCouponMapper;

    @Autowired
    private WxCouponMapper wxCouponMapper;

    @Autowired
    private IWxCouponService couponService;
    /**
     * 查询优惠券历史
     * 
     * @param id 优惠券历史主键
     * @return 优惠券历史
     */
    @Override
    public WxUserCoupon selectWxUserCouponById(Long id)
    {
        return wxUserCouponMapper.selectWxUserCouponById(id);
    }

    /**
     * 查询优惠券历史列表
     * 
     * @param wxUserCoupon 优惠券历史
     * @return 优惠券历史
     */
    @Override
    public List<WxUserCoupon> selectWxUserCouponList(WxUserCoupon wxUserCoupon)
    {
        couponsExpired();
        return wxUserCouponMapper.selectWxUserCouponList(wxUserCoupon);
    }

    /**
     * 新增优惠券历史
     * 
     * @param wxUserCoupon 优惠券历史
     * @return 结果
     */
    @Override
    public int insertWxUserCoupon(WxUserCoupon wxUserCoupon)
    {
        wxUserCoupon.setCreateTime(LocalDateTime.now());
        return wxUserCouponMapper.insertWxUserCoupon(wxUserCoupon);
    }

    /**
     * 修改优惠券历史
     * 
     * @param wxUserCoupon 优惠券历史
     * @return 结果
     */
    @Override
    public int updateWxUserCoupon(WxUserCoupon wxUserCoupon)
    {
        wxUserCoupon.setUpdateTime(LocalDateTime.now());
        return wxUserCouponMapper.updateWxUserCoupon(wxUserCoupon);
    }

    /**
     * 批量删除优惠券历史
     * 
     * @param ids 需要删除的优惠券历史主键
     * @return 结果
     */
    @Override
    public int deleteWxUserCouponByIds(Long[] ids)
    {
        return wxUserCouponMapper.deleteWxUserCouponByIds(ids);
    }

    /**
     * 删除优惠券历史信息
     * 
     * @param id 优惠券历史主键
     * @return 结果
     */
    @Override
    public int deleteWxUserCouponById(Long id)
    {
        return wxUserCouponMapper.deleteWxUserCouponById(id);
    }

    /**
     * 查询可以领取的优惠券列表
     * @return
     */
    @Override
    public List<IssuingCouponsVO> queryIssuingCoupons() {

        couponService.checkCouponExpired();

        //1.查询发放中的优惠劵列表
        List<WxCoupon> coupons = couponService.lambdaQuery()
                .eq(WxCoupon::getStatus, CouponConstant.CouponStatus.IN_PROGRESS.getCode())
                .eq(WxCoupon::getObtainWay, CouponConstant.ObtainWay.MANUAL.getCode())
                .list();


        if (coupons.isEmpty()){
            return Collections.emptyList();
        }

        //2.统计当前用户已经领取的优惠券的信息
        List<Long> couponIds = coupons.stream().map(WxCoupon::getId).collect(Collectors.toList());


        // 2.1.查询当前用户已经领取的优惠券的数据
        List<WxUserCoupon> userCoupons = lambdaQuery()
                .eq(WxUserCoupon::getUserId, UserContext.getUser())
                .in(WxUserCoupon::getCouponId, couponIds)
                .list();


        // 2.2.统计当前用户对优惠券的已经领取数量
        Map<Long, Long> issuedMap = userCoupons.stream()
                .collect(Collectors.groupingBy(WxUserCoupon::getCouponId, Collectors.counting()));

        //2.3.统计当前用户对优惠券的已经领取并且未使用的数量
        Map<Long, Long> usedMap = userCoupons.stream().filter(uc -> uc.getStatus().equals(CouponStatusContant.UserCouponStatus.NOT_USED.getCode()))
                .collect(Collectors.groupingBy(WxUserCoupon::getCouponId, Collectors.counting()));

        //3.封装数据
        List<IssuingCouponsVO> list = new ArrayList<>(coupons.size());
        for (WxCoupon c:coupons){
            IssuingCouponsVO vo = new IssuingCouponsVO();
            BeanUtils.copyProperties(c,vo);
            vo.setRemainingNum((long)c.getTotalNum()-c.getIssueNum());
            list.add(vo);
            vo.setAvailable(
                    c.getIssueNum()<c.getTotalNum()&&issuedMap.getOrDefault(c.getId(),0L)<c.getUserLimit()
            );

            vo.setReceived(usedMap.getOrDefault(c.getId(),0L)>0);
        }

        return list;
    }

    /**
     * 领取优惠券
     * @param couponId
     */
    @Override
    public void receiveCoupon(Long couponId) {
        WxCoupon coupon = wxCouponMapper.selectById(couponId);
        if (coupon==null){
            throw new IllegalArgumentException("优惠券不存在");
        }
        LocalDateTime now = LocalDateTime.now();
        if (now.isBefore(coupon.getIssueBeginTime())||now.isAfter(coupon.getIssueEndTime())){
            throw new IllegalArgumentException("优惠券发放已经结束或尚未开始");
        }

        if(coupon.getIssueNum()>=coupon.getTotalNum()){
            throw new IllegalArgumentException("优惠券已经领完了");
        }

        Long userId = UserContext.getUser();
        synchronized (userId.toString().intern()){
            IWxUserCouponService userCouponService=(IWxUserCouponService) AopContext.currentProxy();
            userCouponService.checkAndCreateUserCoupon(coupon,userId);
        }

    }

    /**
     * 校验优惠券是否可以领取，如果可以则创建优惠券
     * @param coupon
     * @param userId
     */

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void checkAndCreateUserCoupon(WxCoupon coupon, Long userId) {


        // 4.校验每人限领数量
        // 4.1.统计当前用户对当前优惠券的已经领取的数量
        Integer count = lambdaQuery()
                .eq(WxUserCoupon::getUserId, userId)
                .eq(WxUserCoupon::getCouponId, coupon.getId())
                .count();
        //4.2.校验限领数量
        if (count!=null && count>= coupon.getUserLimit()){
            throw new IllegalArgumentException("超出每人限领数量");
        }

        //5.更新优惠券的已经发放的数量 + 1
        int r=wxCouponMapper.incrIssueNum(coupon.getId());
        if (r==0){
            throw new IllegalArgumentException("优惠券库存不足");
        }

        // 6.新增一个用户券
        saveUserCoupon(coupon, userId);
    }

    /**
     * 查询个人优惠券列表
     * @param wxUserCoupon
     * @return
     */
    @Override
    public List<CouponVO> queryUserCoupons(WxUserCoupon wxUserCoupon) {
        couponsExpired();
        wxUserCoupon.setUserId(UserContext.getUser());
        List<WxUserCoupon> userCoupons = wxUserCouponMapper.selectWxUserCouponList(wxUserCoupon);
        if (userCoupons.isEmpty()){
            return Collections.emptyList();
        }
        //2.查询优惠券的信息
        List<Long> couponIds = userCoupons.stream().map(WxUserCoupon::getCouponId).collect(Collectors.toList());
        List<WxCoupon> coupons = couponService.lambdaQuery().in(WxCoupon::getId, couponIds).list();

        //3.封装数据

        return userCoupons.stream().map(uc -> {
            CouponVO vo = new CouponVO();
            BeanUtils.copyProperties(uc, vo);
            coupons.stream()
                    .filter(c -> c.getId().equals(uc.getCouponId()))
                    .findFirst()
                    .ifPresent(c -> {
                        vo.setName(c.getName());
                        vo.setDiscountType(c.getDiscountType());
                        vo.setThresholdAmount(c.getThresholdAmount());
                        vo.setDiscountValue(c.getDiscountType());
                        vo.setTermDays(c.getTermDays());
                        vo.setObtainWay(c.getObtainWay());
                        vo.setTermBeginTime(c.getTermBeginTime());
                        vo.setTermEndTime(c.getTermEndTime());
                    });
            return vo;
        }).collect(Collectors.toList());
    }

    /**
     * 用户券过期检查
     *
     */
    @Override
    public void couponsExpired() {
        //1.查询过期的优惠券
        List<WxUserCoupon> userCoupons = lambdaQuery()
                .le(WxUserCoupon::getTermEndTime, LocalDateTime.now())
                .isNotNull(WxUserCoupon::getTermEndTime) // 确保TermEndTime不为空
                .eq(WxUserCoupon::getStatus, CouponStatusContant.UserCouponStatus.NOT_USED.getCode())
                .list();

        if (userCoupons.isEmpty()){
            return;
        }

        //2.更新优惠券的状态为已过期
        List<Long> ids = userCoupons.stream().map(WxUserCoupon::getId).collect(Collectors.toList());
        WxUserCoupon uc = new WxUserCoupon();
        uc.setStatus(CouponStatusContant.UserCouponStatus.EXPIRED.getCode());
        lambdaUpdate().in(WxUserCoupon::getId,ids).update(uc);
    }

    /**
     * 使用优惠券
     * @param id
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void useCoupon(Long id,Long orderId) {
        //1.查询用户优惠券
        WxUserCoupon userCoupon = getById(id);
        if (userCoupon==null){
            throw new IllegalArgumentException("优惠券不存在");
        }
        if (!userCoupon.getUserId().equals(UserContext.getUser())){
            throw new IllegalArgumentException("优惠券不属于当前用户");
        }
        if (!userCoupon.getStatus().equals(CouponStatusContant.UserCouponStatus.NOT_USED.getCode())){
            throw new IllegalArgumentException("优惠券已经使用或者已经过期");
        }

        //2.更新优惠券状态为已使用
        WxUserCoupon uc = new WxUserCoupon();
        uc.setStatus(CouponStatusContant.UserCouponStatus.USED.getCode());
        uc.setUpdateTime(LocalDateTime.now());
        uc.setId(id);
        uc.setOrderId(orderId);
        updateById(uc);

        //3.更新已使用的数量
        int c=wxCouponMapper.incrUsedNum(userCoupon.getCouponId());
        if(c<1){
            throw new IllegalArgumentException("更新优惠券使用数量失败");
        }

    }

    /**
     * 查询当前订单可用优惠券
     * @param userId
     * @return
     */
    @Override
    public List<CouponVO> queryAvailableCoupons(Long userId) {

        couponsExpired();
        //1.查询当前用户所有可用的优惠券
        List<WxUserCoupon> userCoupons = lambdaQuery()
                .eq(WxUserCoupon::getUserId, userId)
                .eq(WxUserCoupon::getStatus, CouponStatusContant.UserCouponStatus.NOT_USED.getCode())
                .list();

        if (userCoupons.isEmpty()){
            return Collections.emptyList();
        }

        //2.查询优惠券的信息
        List<Long> couponIds = userCoupons.stream().map(WxUserCoupon::getCouponId).collect(Collectors.toList());
        List<WxCoupon> coupons = couponService.lambdaQuery().in(WxCoupon::getId, couponIds).list();

        //3.封装数据
        return userCoupons.stream().map(uc -> {
            CouponVO vo = new CouponVO();
            BeanUtils.copyProperties(uc, vo);
            coupons.stream()
                    .filter(c -> c.getId().equals(uc.getCouponId()))
                    .findFirst()
                    .ifPresent(c -> {
                        vo.setName(c.getName());
                        vo.setDiscountType(c.getDiscountType());
                        vo.setDiscountValue(c.getDiscountType());
                    });
            return vo;
        }).collect(Collectors.toList());

    }

    /**
     * 退还优惠券
     * @param id
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void returnCoupon(Long id) {
        //1.查询用户优惠券
        WxUserCoupon userCoupon = getById(id);
        if (userCoupon==null){
            throw new IllegalArgumentException("优惠券不存在");
        }
        if (!userCoupon.getUserId().equals(UserContext.getUser())){
            throw new IllegalArgumentException("优惠券不属于当前用户");
        }


        //2.更新优惠券状态为未使用
        WxUserCoupon uc = new WxUserCoupon();
        uc.setStatus(CouponStatusContant.UserCouponStatus.NOT_USED.getCode());
        uc.setUpdateTime(LocalDateTime.now());
        uc.setId(id);
        uc.setOrderId(null);
        updateById(uc);

        //3.更新已使用的数量
        int c=wxCouponMapper.decrUsedNum(userCoupon.getCouponId());
        if(c<1){
            throw new IllegalArgumentException("更新优惠券使用数量失败");
        }

    }

    /**
     * 保存用户优惠券
     * @param coupon
     * @param userId
     */
    private void saveUserCoupon(WxCoupon coupon,Long userId){
        //1.基本信息
        WxUserCoupon uc = new WxUserCoupon();
        uc.setUserId(userId);
        uc.setCouponId(coupon.getId());
        //2.有效期信息
        LocalDateTime termBeginTime = coupon.getTermBeginTime();
        LocalDateTime termEndTime = coupon.getTermEndTime();
        if (termBeginTime==null){
            termBeginTime = LocalDateTime.now();
            termEndTime = termBeginTime.plusDays(coupon.getTermDays());
        }

        uc.setTermBeginTime(termBeginTime);
        uc.setTermEndTime(termEndTime);

        save(uc);
    }
}
