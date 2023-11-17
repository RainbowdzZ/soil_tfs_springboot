package com.ruoyi.wx.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.exception.order.NotParmException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.WxUserFarm;
import com.ruoyi.wx.domain.vo.WxOrderVo;
import com.ruoyi.wx.enums.IsDeleteConstant;
import com.ruoyi.wx.enums.OrderStatus;
import com.ruoyi.wx.mapper.TfsOrderMapper;
import com.ruoyi.wx.service.ITfsOrderService;
import com.ruoyi.wx.mapper.WxCouponMapper;
import com.ruoyi.wx.service.IWxUserCouponService;
import com.ruoyi.wx.service.IWxUserFarmService;
import com.ruoyi.wx.utils.LocationUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;




/**
 * 订单管理Service业务层处理
 * 
 * @author riki
 * @date 2023-11-02
 */
@Service
public class TfsOrderServiceImpl extends ServiceImpl<TfsOrderMapper, TfsOrder> implements ITfsOrderService
{
    private static final Logger logger = Logger.getLogger(TfsOrderServiceImpl.class.getName());
    private Map<Long, ScheduledExecutorService> schedulerMap = new HashMap<>();

    @Autowired
    private IWxUserCouponService wxUserCouponService;

    @Autowired
    private WxCouponMapper wxCouponMapper;

    @Autowired
    private IWxUserFarmService wxUserFarmService;

    //生成土壤号
// 生成土壤号
    private Long generateSoilNumber(int countToday) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String date = dateFormat.format(new Date());
        String countStr = String.format("%04d", countToday + 1);
        String soilNumberStr = date + countStr;
        try {
            return Long.parseLong(soilNumberStr);
        } catch (NumberFormatException e) {
            // 处理转换错误
            e.printStackTrace();
            return 0L; // 或者根据需要返回适当的默认值
        }
    }

    /**
     * 定时任务
     * @param tfsOrder
     */
    // 在订单创建时调用此方法以启动定时任务

    private void scheduleOrderCancellationTask(TfsOrder tfsOrder) {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        scheduler.schedule(() -> {
            // 执行取消订单的逻辑
            tfsOrder.setOrderStatus(OrderStatus.CANCELLED.getCode());
            updateTfsOrder(tfsOrder);
            logger.info("Order " + tfsOrder.getId() + " has been cancelled.");
        }, 15, TimeUnit.MINUTES);

        schedulerMap.put(tfsOrder.getId(), scheduler);
    }


    /**
     * 取消定时任务
     * @param tfsOrder
     */
    public void cancelScheduledTask(TfsOrder tfsOrder) {
        // 获取订单对应的 ScheduledExecutorService
        ScheduledExecutorService scheduler = schedulerMap.get(tfsOrder.getId());
        if (scheduler != null) {
            // 关闭该订单的线程池，终止计划任务，并中断正在执行的任务
            List<Runnable> pendingTasks = scheduler.shutdownNow();

            // 打印日志，记录被中断的任务信息
            for (Runnable task : pendingTasks) {
                logger.warning("Interrupted task: " + task.toString());
            }

            // 从映射中移除
            schedulerMap.remove(tfsOrder.getId());
        }
    }



    @Autowired
    private TfsOrderMapper tfsOrderMapper;
    /**
     * 统计今日订单数
     */
    private int countOrdersToday() {
        return tfsOrderMapper.countOrdersToday();
    }
    /**
     * 查询订单管理
     * 
     * @param id 订单管理主键
     * @return 订单管理
     */
    @Override
    public TfsOrder selectTfsOrderById(Long id)
    {
        return tfsOrderMapper.selectTfsOrderById(id);
    }

    /**
     * 查询订单管理列表
     * 
     * @param tfsOrder 订单管理
     * @return 订单管理
     */
    @Override
    public List<TfsOrder> selectTfsOrderList(TfsOrder tfsOrder)
    {

        List<TfsOrder> tfsOrders = tfsOrderMapper.selectTfsOrderList(tfsOrder);
        for (TfsOrder order : tfsOrders) {
            checkOrderExpiration(order);
        }
        return tfsOrders;
    }

    @Override
    public void checkOrderExpiration(TfsOrder tfsOrder) {
        // 如果订单状态为待支付，且订单创建时间超过15分钟，则将订单状态设置为已取消
        if (tfsOrder.getOrderStatus().equals(OrderStatus.UNPAID.getCode())) {
            LocalDateTime orderTime = tfsOrder.getOrderTime();
            LocalDateTime now = LocalDateTime.now();
            if (now.isAfter(orderTime.plusMinutes(15))) {
                tfsOrder.setOrderStatus(OrderStatus.CANCELLED.getCode());
                updateTfsOrder(tfsOrder);
            }
        }
    }

    /**
     * 提交订单
     * 
     * @param tfsOrder 提交订单
     * @return 结果
     */
    @Override
    public Long insertTfsOrder(TfsOrder tfsOrder) {


        if (tfsOrder.getFarmId()==null){
            throw new NotParmException();
        }

        int countToday = countOrdersToday();
        // 生成新的土壤号
        Long soilNumber = generateSoilNumber(countToday);
        try {
            tfsOrder.setSoilNumber(soilNumber);
        } catch (NumberFormatException e) {
            // 处理转换错误
            e.printStackTrace();
        }


        tfsOrder.setOrderTime(LocalDateTime.now());
        tfsOrder.setOrderStatus(OrderStatus.UNPAID.getCode());
        // 插入订单，并获取数据库生成的ID
        tfsOrderMapper.insertTfsOrderWithKey(tfsOrder);


        // 获取数据库生成的ID
        Long orderId = tfsOrder.getId();

        // 设置ID
        tfsOrder.setId(orderId);


        // 调用定时任务
        this.scheduleOrderCancellationTask(tfsOrder);

        return orderId; // 返回1表示插入成功，可以根据实际情况调整返回值
    }

    /**
     * 支付
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void processOrderPayment(TfsOrder tfsOrder) {
        cancelScheduledTask(tfsOrder);
        // 根据订单号查询订单信息
        TfsOrder order = new TfsOrder();
        order.setId(tfsOrder.getId());
        order.setOrderStatus(OrderStatus.TO_BE_COLLECTED.getCode());
        // 使用优惠劵
        wxUserCouponService.useCoupon(tfsOrder.getUserCouponId(), tfsOrder.getId());
        order.setUserCouponId(tfsOrder.getUserCouponId());


        updateTfsOrder(order);

    }

    /**
     * 修改订单管理
     * 
     * @param tfsOrder 订单管理
     * @return 结果
     */
    @Override
    public int updateTfsOrder(TfsOrder tfsOrder)
    {
        logger.info("Updating order with ID: " + tfsOrder.getId());

        return tfsOrderMapper.updateTfsOrder(tfsOrder);
    }

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的订单管理主键
     * @return 结果
     */
    @Override
    public int deleteTfsOrderByIds(Long[] ids)
    {
        return tfsOrderMapper.deleteTfsOrderByIds(ids);
    }

    /**
     * 删除订单管理信息
     * 
     * @param id 订单管理主键
     * @return 结果
     */
    @Override
    public int deleteTfsOrderById(Long id)
    {
        return tfsOrderMapper.deleteTfsOrderById(id);
    }

    @Override
    public void cancelOrder(Long orderId) {
        TfsOrder order = tfsOrderMapper.selectTfsOrderById(orderId);
        if (order.getOrderStatus().equals(OrderStatus.UNPAID.getCode())) {
            // 取消订单
            order.setOrderStatus(OrderStatus.CANCELLED.getCode());
            updateTfsOrder(order);
            // 取消定时任务
            cancelScheduledTask(order);
        }else if (order.getOrderStatus().equals(OrderStatus.TO_BE_COLLECTED.getCode())||order.getOrderStatus().equals(OrderStatus.TO_BE_INSPECTED.getCode())) {
            // 退款
            order.setOrderStatus(OrderStatus.CANCELLED.getCode());
            wxUserCouponService.returnCoupon(order.getUserCouponId());
            updateTfsOrder(order);
            // 取消定时任务
            cancelScheduledTask(order);
        }
    }

    @Override
    public List<WxOrderVo> selectOrderByUserId(Long wxUserId) {

        // 查询订单列表
        List<TfsOrder> list = lambdaQuery()
                .eq(TfsOrder::getWxUserId, wxUserId)
                .eq(TfsOrder::getIsDelete, IsDeleteConstant.NO.getCode())
                .orderByDesc(TfsOrder::getOrderTime)
                .list();

        for (TfsOrder order : list) {
            checkOrderExpiration(order);
        }
        //查询对应的土壤信息
        List<WxOrderVo> wxOrderVos = new ArrayList<>();

        for (TfsOrder tfsOrder : list) {
            WxOrderVo wxOrderVo = new WxOrderVo();
            wxOrderVo.setOrderId(tfsOrder.getId());
            wxOrderVo.setOrderTime(tfsOrder.getOrderTime());
            wxOrderVo.setOrderStatus(tfsOrder.getOrderStatus());
            wxOrderVo.setSoilNumber(tfsOrder.getSoilNumber());
            wxOrderVo.setSoilUrl(tfsOrder.getSoilUrl());
            wxOrderVo.setShippingType(tfsOrder.getShippingType());

            WxUserFarm farm = wxUserFarmService.selectWxUserFarmById(tfsOrder.getFarmId());
            wxOrderVo.setPlantCategory(farm.getPlantCategory());
            wxOrderVo.setScale(farm.getScale());
            wxOrderVo.setAddress(farm.getProvinceName()+farm.getCityName()+farm.getDistrictName()+farm.getDetail());
            wxOrderVos.add(wxOrderVo);
        }


        return wxOrderVos;
    }
}
