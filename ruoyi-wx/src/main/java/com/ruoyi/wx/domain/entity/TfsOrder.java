package com.ruoyi.wx.domain.entity;

import com.alibaba.fastjson2.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 订单管理对象 tfs_order
 * 
 * @author riki
 * @date 2023-11-02
 */
@TableName("tfs_order")
public class TfsOrder implements Serializable
{
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 订单号 */
    @TableId(value = "id",type = IdType.AUTO)
    @Excel(name = "订单号")
    private Long id;

    /** 用户号 */
    @Excel(name = "用户号")
    private Long wxUserId;

    /** 土壤号 */
    @Excel(name = "土壤号")
    private Long soilNumber;

    /** 订单创建时间 */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "订单创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime orderTime;

    /** 订单状态 */
    @Excel(name = "订单状态 0:未支付 1:待送检 2:待检测 3:待配方 4:已完成 5:已取消 6:待采土")
    private String orderStatus;

    /**
     * 优惠券
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    @Excel(name = "优惠券记录")
    private Long userCouponId;

    private String soilUrl;

    private Double latitude;  // 存储纬度信息
    private Double longitude; // 存储经度信息

    private String courierNumber; // 快递单号

    private Long shippingType; // 配送方式

    public String getCourierNumber() {
        return courierNumber;
    }

    public void setCourierNumber(String courierNumber) {
        this.courierNumber = courierNumber;
    }

    public Long getShippingType() {
        return shippingType;
    }

    public void setShippingType(Long shippingType) {
        this.shippingType = shippingType;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getSoilUrl() {
        return soilUrl;
    }

    public void setSoilUrl(String soilUrl) {
        this.soilUrl = soilUrl;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private String address;

    private Long farmId;

    public Long getFarmId() {
        return farmId;
    }

    public void setFarmId(Long farmId) {
        this.farmId = farmId;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setWxUserId(Long wxUserId) 
    {
        this.wxUserId = wxUserId;
    }

    public Long getWxUserId() 
    {
        return wxUserId;
    }
    public void setSoilNumber(Long soilNumber)
    {
        this.soilNumber = soilNumber;
    }

    public Long getSoilNumber()
    {
        return soilNumber;
    }
    public void setOrderTime(LocalDateTime orderTime)
    {
        this.orderTime = orderTime;
    }

    public LocalDateTime getOrderTime()
    {
        return orderTime;
    }
    public void setOrderStatus(String orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus() 
    {
        return orderStatus;
    }




    public Long getUserCouponId() {
        return userCouponId;
    }

    public void setUserCouponId(Long userCouponId) {
        this.userCouponId = userCouponId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("wxUserId", getWxUserId())
            .append("soilNumber", getSoilNumber())
            .append("orderTime", getOrderTime())
            .append("orderStatus", getOrderStatus())
//            .append("recipeId", getRecipeId())
//            .append("checkupId", getCheckupId())
                .append("userCouponId", getUserCouponId())
                .append("farmId", getFarmId())
                .append("soilUrl", getSoilUrl())
                .append("latitude", getLatitude())
                .append("longitude", getLongitude())
                .append("address", getAddress())
            .toString();
    }
}
