package com.ruoyi.wx.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class TfsCheckup extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 检测单号 */
    @Excel(name = "检测单号")
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private Long orderId;

    /**创建时间*/
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Excel(name = "检测单创建时间", width = 30, dateFormat = "yyyy-MM-dd hh:mm:ss")
    private LocalDateTime submissionTime;

    /**检测指标id*/
    @Excel(name = "检测指标号")
    private Long checkupIndicatorId;
    /**检测指标名称*/
    @Excel(name = "检测指标名称")
    private String checkupIndicatorName;
    /**检测指标单位*/
    @Excel(name = "检测指标单位")
    private String unit;
    /**检测指标数值*/
    @Excel(name = "检测指标数组")
    private BigDecimal checkupValue;
    /**检测指标等级*/
    @Excel(name = "检测指标数组")
    private int level;

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getSubmissionTime() {
        return submissionTime;
    }

    public void setSubmissionTime(LocalDateTime submissionTime) {
        this.submissionTime = submissionTime;
    }

    public Long getCheckupIndicatorId() {
        return checkupIndicatorId;
    }

    public void setCheckupIndicatorId(Long checkupIndicatorId) {
        this.checkupIndicatorId = checkupIndicatorId;
    }

    public String getCheckupIndicatorName() {
        return checkupIndicatorName;
    }

    public void setCheckupIndicatorName(String checkupIndicatorName) {
        this.checkupIndicatorName = checkupIndicatorName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public BigDecimal getCheckupValue() {
        return checkupValue;
    }

    public void setCheckupValue(BigDecimal checkupValue) {
        this.checkupValue = checkupValue;
    }


        }


