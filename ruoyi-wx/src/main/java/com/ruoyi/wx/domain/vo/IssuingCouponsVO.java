package com.ruoyi.wx.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.time.LocalDateTime;

public class IssuingCouponsVO {
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

    public LocalDateTime getIssueBeginTime() {
        return issueBeginTime;
    }

    public void setIssueBeginTime(LocalDateTime issueBeginTime) {
        this.issueBeginTime = issueBeginTime;
    }

    public LocalDateTime getIssueEndTime() {
        return issueEndTime;
    }

    public void setIssueEndTime(LocalDateTime issueEndTime) {
        this.issueEndTime = issueEndTime;
    }

    /** 优惠券id */
    private Long id;

    /** 优惠券名称 */
    private String name;

    /** 折扣类型 */
    private Long discountType;

    /** 折扣门槛*/
    private Long thresholdAmount;

    /** 折扣金额 */
    private Long discountValue;

    /** 是否可领取 */
    private Boolean available;

    /** 是否已领取 */
    private Boolean received;

    /** 开始发放时间 */

    private LocalDateTime issueBeginTime;

    /** 结束发放时间 */

    private LocalDateTime issueEndTime;
    /**
     * 剩余数量
     */
    private Long remainingNum;

    public Long getRemainingNum() {
        return remainingNum;
    }

    public void setRemainingNum(Long remainingNum) {
        this.remainingNum = remainingNum;
    }
}
