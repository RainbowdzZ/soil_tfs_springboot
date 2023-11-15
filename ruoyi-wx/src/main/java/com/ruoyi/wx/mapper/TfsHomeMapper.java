package com.ruoyi.wx.mapper;
import com.ruoyi.wx.domain.dto.HomeDto;
import java.util.List;

public interface TfsHomeMapper {
    /**
     * 查询今日已支付订单数
     */
    public int selectCountTodayOrders();

    /**
     * 查询某状态的订单数
     * type:订单状态
     */
    public int selectCountStatusOrders(int type);

    /**
     * 查询用户数量
     */
    public int selectCountUsers();

    /**
     * 查询用户反馈数量
     */
    public int selectCountFeedback();

    /**
     * 查询本周已支付订单
     */
    public List<HomeDto.DateCount> selectCountWeekOrders();

    /**
     * 查询本月已支付订单
     */
    public List<HomeDto.DateCount> selectCountMonthOrders();

    /**
     * 查询全年已支付订单
     */
    public List<HomeDto.DateCount> selectCountYearOrders();


}
