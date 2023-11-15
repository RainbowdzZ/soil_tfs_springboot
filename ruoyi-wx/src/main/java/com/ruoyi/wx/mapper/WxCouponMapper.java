package com.ruoyi.wx.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.wx.domain.entity.WxCoupon;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * 优惠券Mapper接口
 * 
 * @author xqb
 * @date 2023-11-05
 */
public interface WxCouponMapper extends BaseMapper<WxCoupon>
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
     * 删除优惠券
     * 
     * @param id 优惠券主键
     * @return 结果
     */
    public int deleteWxCouponById(Long id);

    /**
     * 批量删除优惠券
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxCouponByIds(Long[] ids);

    @Update("update wx_coupon set issue_num = issue_num + 1 where  id = #{couponId} AND issue_num < total_num")
    int incrIssueNum(@Param("couponId") Long couponId);

    @Update("update wx_coupon set used_num = used_num + 1 where  id = #{couponId} AND used_num < total_num")
    int incrUsedNum(Long couponId);

    @Update("update wx_coupon set used_num = used_num - 1 where  id = #{couponId} AND used_num > 0")
    int decrUsedNum(Long couponId);
}
