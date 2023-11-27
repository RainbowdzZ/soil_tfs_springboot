package com.ruoyi.wx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.wx.domain.dto.TfsOrderDto;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.domain.vo.WxOrderVo;

import java.util.List;

/**
 * 订单管理Service接口
 * 
 * @author riki
 * @date 2023-11-02
 */
public interface ITfsOrderService  extends IService<TfsOrder>
{
    /**
     * 支付订单
     */
    void processOrderPayment(TfsOrder tfsOrder);
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
     * @param tfsOrder 订单管理
     * @return 结果
     */
    public Long insertTfsOrder(TfsOrder tfsOrder);

    /**
     * 修改订单管理
     * 
     * @param tfsOrder 订单管理
     * @return 结果
     */
    public int updateTfsOrder(TfsOrder tfsOrder);

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的订单管理主键集合
     * @return 结果
     */
    public int deleteTfsOrderByIds(Long[] ids);

    /**
     * 删除订单管理信息
     * 
     * @param id 订单管理主键
     * @return 结果
     */
    public int deleteTfsOrderById(Long id);

    /**
     * 取消订单
     * @param orderId
     */
    void cancelOrder(Long orderId);

    /**
     * 根据用户id查询订单
     * @param wxUserId
     * @return
     */
    List<WxOrderVo> selectOrderByUserId(Long wxUserId);

    /**
     * 订单列表增加联系人，联系电话查询
     * @param tfsOrder
     * @return
     */
    List<TfsOrderDto> selectTfsOrderDtoList(TfsOrder tfsOrder);

    /**
     * 检测订单是否过期
     * @param tfsOrder
     */
    void checkOrderExpiration(TfsOrder tfsOrder);

    /**
     * 对象拷贝，给订单列表查询增加字段
     * @param list
     * @return
     */
    List<TfsOrderDto> mapTfsOrdersToDtoList(List<TfsOrder> list);
}
