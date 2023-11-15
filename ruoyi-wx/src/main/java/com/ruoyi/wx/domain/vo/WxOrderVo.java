package com.ruoyi.wx.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

public class WxOrderVo {

    private Long orderId;

    private Long soilNumber;

    private String orderStatus;

    private String plantCategory;

    private String scale;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private LocalDateTime orderTime;

    private String soilUrl;

    private String address;

    private Long shippingType;

    public Long getShippingType() {
        return shippingType;
    }

    public void setShippingType(Long shippingType) {
        this.shippingType = shippingType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getSoilNumber() {
        return soilNumber;
    }

    public void setSoilNumber(Long soilNumber) {
        this.soilNumber = soilNumber;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPlantCategory() {
        return plantCategory;
    }

    public void setPlantCategory(String plantCategory) {
        this.plantCategory = plantCategory;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public String getSoilUrl() {
        return soilUrl;
    }

    public void setSoilUrl(String soilUrl) {
        this.soilUrl = soilUrl;
    }



}
