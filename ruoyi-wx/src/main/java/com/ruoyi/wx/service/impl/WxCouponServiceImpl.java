package com.ruoyi.wx.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;

import com.ruoyi.wx.domain.dto.CouponIssueFormDTO;
import com.ruoyi.wx.enums.CouponConstant;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wx.mapper.WxCouponMapper;
import com.ruoyi.wx.domain.entity.WxCoupon;
import com.ruoyi.wx.service.IWxCouponService;

/**
 * 优惠券Service业务层处理
 * 
 * @author xqb
 * @date 2023-11-05
 */
@Service
public class WxCouponServiceImpl extends ServiceImpl<WxCouponMapper, WxCoupon> implements IWxCouponService
{
    @Autowired
    private WxCouponMapper wxCouponMapper;

    /**
     * 查询优惠券
     * 
     * @param id 优惠券主键
     * @return 优惠券
     */
    @Override
    public WxCoupon selectWxCouponById(Long id)
    {
        return wxCouponMapper.selectWxCouponById(id);
    }

    /**
     * 查询优惠券列表
     * 
     * @param wxCoupon 优惠券
     * @return 优惠券
     */
    @Override
    public List<WxCoupon> selectWxCouponList(WxCoupon wxCoupon)
    {
        checkCouponExpired();
        return wxCouponMapper.selectWxCouponList(wxCoupon);
    }

    /**
     * 新增优惠券
     * 
     * @param wxCoupon 优惠券
     * @return 结果
     */
    @Override
    public int insertWxCoupon(WxCoupon wxCoupon)
    {
        wxCoupon.setCreateTime(LocalDateTime.now());
        return wxCouponMapper.insertWxCoupon(wxCoupon);
    }

    /**
     * 修改优惠券
     * 
     * @param wxCoupon 优惠券
     * @return 结果
     */
    @Override
    public int updateWxCoupon(WxCoupon wxCoupon)
    {
        wxCoupon.setUpdateTime(LocalDateTime.now());
        return wxCouponMapper.updateWxCoupon(wxCoupon);
    }

    /**
     * 批量删除优惠券
     * 
     * @param ids 需要删除的优惠券主键
     * @return 结果
     */
    @Override
    public int deleteWxCouponByIds(Long[] ids)
    {
        return wxCouponMapper.deleteWxCouponByIds(ids);
    }

    /**
     * 删除优惠券信息
     * 
     * @param id 优惠券主键
     * @return 结果
     */
    @Override
    public int deleteWxCouponById(Long id)
    {
        return wxCouponMapper.deleteWxCouponById(id);
    }

    /**
     * 发放优惠劵功能
     *
     */
    @Override
    public void beginIssue(Long id) {
        WxCoupon coupon = wxCouponMapper.selectWxCouponById(id);

        if (coupon == null) {
            throw new RuntimeException("优惠券不存在");
        }

        if ((!coupon.getStatus().equals(CouponConstant.CouponStatus.TO_ISSUE.getCode()) && (!coupon.getStatus().equals(CouponConstant.CouponStatus.PAUSED.getCode()))) ) {
            throw new RuntimeException("优惠券状态不正常");
        }
        LocalDateTime nowDate = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
        if (coupon.getIssueEndTime() != null && nowDate.isAfter(coupon.getIssueEndTime())) {
            throw new RuntimeException("优惠券发放时间已过期");
        }


        LocalDateTime issueBeginTime = coupon.getIssueBeginTime();

        LocalDateTime now = LocalDateTime.now();
        System.out.println(now);

        boolean isBegin = (issueBeginTime == null) || (now.isEqual(issueBeginTime) || now.isAfter(issueBeginTime));



        WxCoupon updateCoupon = new WxCoupon();
        BeanUtils.copyProperties(coupon, updateCoupon);

        if (isBegin) {
            updateCoupon.setStatus(CouponConstant.CouponStatus.IN_PROGRESS.getCode());
            updateCoupon.setIssueBeginTime(now);
        } else {
            updateCoupon.setStatus(CouponConstant.CouponStatus.NOT_STARTED.getCode());
        }

        wxCouponMapper.updateWxCoupon(updateCoupon);
    }

    /**
     * 暂停发放优惠劵
     * @param id
     */
    @Override
    public void stopIssue(Long id) {
        WxCoupon wxCoupon = wxCouponMapper.selectWxCouponById(id);
        wxCoupon.setStatus(CouponConstant.CouponStatus.PAUSED.getCode());
        wxCouponMapper.updateWxCoupon(wxCoupon);
    }

    /**
     * 优惠劵活动过期
     */
    @Override
    public void checkCouponExpired() {
        lambdaQuery().le(WxCoupon::getIssueEndTime, LocalDateTime.now())
                    .isNotNull(WxCoupon::getIssueEndTime)
                    .eq(WxCoupon::getStatus, CouponConstant.CouponStatus.IN_PROGRESS.getCode())
                    .list().forEach(coupon -> {
                coupon.setStatus(CouponConstant.CouponStatus.ENDED.getCode());
                updateById(coupon); });
    }
}
