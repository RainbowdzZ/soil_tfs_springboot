package com.ruoyi.wx.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.wx.domain.entity.WxCoupon;
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.domain.vo.CouponVO;
import com.ruoyi.wx.domain.vo.IssuingCouponsVO;

/**
 * 优惠券历史Service接口
 * 
 * @author xqb
 * @date 2023-11-06
 */
public interface IWxUserCouponService extends IService<WxUserCoupon>
{
    /**
     * 查询优惠券历史
     * 
     * @param id 优惠券历史主键
     * @return 优惠券历史
     */
    public WxUserCoupon selectWxUserCouponById(Long id);

    /**
     * 查询优惠券历史列表
     * 
     * @param wxUserCoupon 优惠券历史
     * @return 优惠券历史集合
     */
    public List<WxUserCoupon> selectWxUserCouponList(WxUserCoupon wxUserCoupon);

    /**
     * 新增优惠券历史
     * 
     * @param wxUserCoupon 优惠券历史
     * @return 结果
     */
    public int insertWxUserCoupon(WxUserCoupon wxUserCoupon);

    /**
     * 修改优惠券历史
     * 
     * @param wxUserCoupon 优惠券历史
     * @return 结果
     */
    public int updateWxUserCoupon(WxUserCoupon wxUserCoupon);

    /**
     * 批量删除优惠券历史
     * 
     * @param ids 需要删除的优惠券历史主键集合
     * @return 结果
     */
    public int deleteWxUserCouponByIds(Long[] ids);

    /**
     * 删除优惠券历史信息
     * 
     * @param id 优惠券历史主键
     * @return 结果
     */
    public int deleteWxUserCouponById(Long id);

    List<IssuingCouponsVO> queryIssuingCoupons();

    void receiveCoupon(Long couponId);

    void checkAndCreateUserCoupon(WxCoupon coupon, Long userId);

    List<CouponVO> queryUserCoupons(WxUserCoupon wxUserCoupon);

    void couponsExpired();

    void useCoupon(Long id, Long orderId);

    List<CouponVO> queryAvailableCoupons(Long userId);

    void returnCoupon(Long id);
}
