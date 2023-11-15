package com.ruoyi.wx.domain.dto;

import lombok.Data;

import java.util.List;

@Data
public class HomeDto {
    @Data
    public static class DataCount {
        private int orderCount;
        private int utSoilCount;
        private int userCount;
        private int feedbackCount;
    }

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
