package com.ruoyi.wx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import org.apache.ibatis.annotations.Options;

import java.util.List;

/**
 * 订单管理Mapper接口
 * 
 * @author riki
 * @date 2023-11-02
 */
public interface TfsOrderMapper extends BaseMapper<TfsOrder>
{
    /**
     * 查询自增的id
     * @param tfsOrder
     * @return
     */
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertTfsOrderWithKey(TfsOrder tfsOrder);
    /**
     * 查询当天的订单量
     */
    public int countOrdersToday();
    /**
     * 查询订单管理
     * 
     * @param id 订单管理主键
     * @return 订单管理
     */
    public TfsOrder selectTfsOrderById(Long id);

    /**
     * 查询订单管理列表
     * 
     * @param tfsOrder 订单管理
     * @return 订单管理集合
     */
    public List<TfsOrder> selectTfsOrderList(TfsOrder tfsOrder);

    /**
     * 提交订单
     * 
     * @param tfsOrder 提交订单
     * @return 结果
     */
//    public int insertTfsOrder(TfsOrder tfsOrder);

    /**
     * 修改订单管理
     * 
     * @param tfsOrder 订单管理
     * @return 结果
     */
    public int updateTfsOrder(TfsOrder tfsOrder);

    /**
     * 删除订单管理
     * 
     * @param id 订单管理主键
     * @return 结果
     */
    public int deleteTfsOrderById(Long id);

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTfsOrderByIds(Long[] ids);
}
