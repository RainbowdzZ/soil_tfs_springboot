package com.ruoyi.wx.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.wx.domain.dto.CouponIssueFormDTO;
import com.ruoyi.wx.domain.entity.WxCoupon;

/**
 * 优惠券Service接口
 * 
 * @author xqb
 * @date 2023-11-05
 */
public interface IWxCouponService extends IService<WxCoupon>
{
    /**
     * 查询优惠券
     * 
     * @param id 优惠券主键
     * @return 优惠券
     */
    public WxCoupon selectWxCouponById(Long id);

    /**
     * 查询优惠券列表
     * 
     * @param wxCoupon 优惠券
     * @return 优惠券集合
     */
    public List<WxCoupon> selectWxCouponList(WxCoupon wxCoupon);

    /**
     * 新增优惠券
     * 
     * @param wxCoupon 优惠券
     * @return 结果
     */
    public int insertWxCoupon(WxCoupon wxCoupon);

    /**
     * 修改优惠券
     * 
     * @param wxCoupon 优惠券
     * @return 结果
     */
    public int updateWxCoupon(WxCoupon wxCoupon);

    /**
     * 批量删除优惠券
     * 
     * @param ids 需要删除的优惠券主键集合
     * @return 结果
     */
    public int deleteWxCouponByIds(Long[] ids);

    /**
     * 删除优惠券信息
     * 
     * @param id 优惠券主键
     * @return 结果
     */
    public int deleteWxCouponById(Long id);

    void beginIssue(Long id);

    void stopIssue(Long id);

    void checkCouponExpired();
}
