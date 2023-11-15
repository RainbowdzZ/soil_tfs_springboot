package com.ruoyi.wx.domain.vo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;
import java.util.Date;

public class CouponVO {

    /** 优惠券id */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long id;

    /** 优惠券名称 */
    private String name;

    /** 折扣类型 */
    private Long discountType;

    /** 折扣门槛*/
    private Long thresholdAmount;

    /** 折扣金额 */
    private Long discountValue;

    /** 有效天数 */
    private Long termDays;

    private Long obtainWay;

    public Long getObtainWay() {
        return obtainWay;
    }

    public void setObtainWay(Long obtainWay) {
        this.obtainWay = obtainWay;
    }

    public LocalDateTime getTermBeginTime() {
        return termBeginTime;
    }

    public void setTermBeginTime(LocalDateTime termBeginTime) {
        this.termBeginTime = termBeginTime;
    }

    private Long status;

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    private LocalDateTime termBeginTime;

    /** 过期时间 */
    private LocalDateTime termEndTime;

    /** 是否可领取 */
    private Boolean available;

    /** 是否已领取 */
    private Boolean received;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getDiscountType() {
        return discountType;
    }

    public void setDiscountType(Long discountType) {
        this.discountType = discountType;
    }

    public Long getThresholdAmount() {
        return thresholdAmount;
    }

    public void setThresholdAmount(Long thresholdAmount) {
        this.thresholdAmount = thresholdAmount;
    }

    public Long getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(Long discountValue) {
        this.discountValue = discountValue;
    }

    public Long getTermDays() {
        return termDays;
    }

    public void setTermDays(Long termDays) {
        this.termDays = termDays;
    }

    public LocalDateTime getTermEndTime() {
        return termEndTime;
    }

    public void setTermEndTime(LocalDateTime termEndTime) {
        this.termEndTime = termEndTime;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public Boolean getReceived() {
        return received;
    }

    public void setReceived(Boolean received) {
        this.received = received;
    }


}
