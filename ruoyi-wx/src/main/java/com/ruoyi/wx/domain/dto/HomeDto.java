package com.ruoyi.wx.domain.dto;

import lombok.Data;

import java.util.List;

/**
 * 首页数据对象
 */
@Data
public class HomeDto {
    @Data
    public static class DataCount {
        //今日交易订单
        private int orderCount;
        //未检测土壤
        private int utSoilCount;
        //用户数量
        private int userCount;
        //反馈数量
        private int feedbackCount;
    }

    //折线图数据
    @Data
    public static class DateCount {
        private String orderDate;
        private int orderCount;
    }

    private DataCount dataCount;
    private List<DateCount> week;
    private List<DateCount> month;
    private List<DateCount> year;

}
