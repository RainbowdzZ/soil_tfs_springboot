package com.ruoyi.wx.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.wx.domain.entity.WxUserCoupon;

/**
 * 优惠券历史Mapper接口
 * 
 * @author xqb
 * @date 2023-11-06
 */
public interface WxUserCouponMapper extends BaseMapper<WxUserCoupon>
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
     * 删除优惠券历史
     * 
     * @param id 优惠券历史主键
     * @return 结果
     */
    public int deleteWxUserCouponById(Long id);

    /**
     * 批量删除优惠券历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxUserCouponByIds(Long[] ids);
}
