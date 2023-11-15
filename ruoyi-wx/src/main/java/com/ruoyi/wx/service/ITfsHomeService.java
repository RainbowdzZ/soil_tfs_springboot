package com.ruoyi.wx.service;


import com.ruoyi.wx.domain.dto.HomeDto;

import java.util.List;

/**
 * 首页数据接口
 */
public interface ITfsHomeService {

    /**
     * 查询今日已支付订单数
     */
    public int CountTodayOrders();

    /**
     * 查询某状态的订单数
     */
    public int CountStatusOrders(int type);

    /**
     * 查询用户数量
     */
    public int CountUsers();

    /**
     * 查询用户反馈数
     */
    public int CountFeedback();

    /**
     * 查询本周每日已支付订单数
     */
    public List<HomeDto.DateCount> CountWeek();

    /**
     * 查询本月每日已支付订单数
     */
    public List<HomeDto.DateCount> CountMonth();

    /**
     * 查询全年每月已支付订单数
     */

    public List<HomeDto.DateCount> CountYear();
}
