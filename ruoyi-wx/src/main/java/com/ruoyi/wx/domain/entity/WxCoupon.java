package com.ruoyi.wx.domain.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * 优惠券对象 wx_coupon
 * 
 * @author xqb
 * @date 2023-11-05
 */

public class WxCoupon implements Serializable
{
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;


    public WxCoupon() {
    }

    /** 优惠券id */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 优惠券名称，可以和活动名称保持一致 */
    @Excel(name = "优惠券名称，可以和活动名称保持一致")
    @NotBlank(message = "优惠券名称不能为空")
    private String name;

    /** 优惠券类型，1：普通券。目前就一种，保留字段 */
    @Excel(name = "优惠券类型，1：普通券。目前就一种，保留字段")
    @NotNull(message = "优惠券类型不能为空")
    private Long type;

    /** 折扣类型，1：满减，2：每满减，3：折扣，4：无门槛 */
    @Excel(name = "折扣类型，1：满减，2：每满减，3：折扣，4：无门槛")
    @NotNull(message = "折扣类型不能为空")
    private Long discountType;

    /** 使用门槛，0：表示无门槛，其他值：最低消费金额 */
    @Excel(name = "使用门槛，0：表示无门槛，其他值：最低消费金额")
    @NotNull(message = "使用门槛不能为空")
    private Long thresholdAmount;

    /** 获取方式：1：手动领取，2：兑换码 */
    @Excel(name = "获取方式：1：手动领取，2：兑换码")
    @NotNull(message = "获取方式不能为空")
    private Long obtainWay;

    /** 开始发放时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始发放时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime issueBeginTime;

    /** 结束发放时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束发放时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime issueEndTime;

    /** 优惠券有效期天数，0：表示有效期是指定有效期的 */
    @Excel(name = "优惠券有效期天数，0：表示有效期是指定有效期的")
    private Long termDays;

    /** 优惠券有效期开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "优惠券有效期开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime termBeginTime;

    /** 优惠券有效期结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "优惠券有效期结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime termEndTime;

    /** 优惠券配置状态，1：待发放，2：未开始   3：进行中，4：已结束，5：暂停 */
    @Excel(name = "优惠券配置状态，1：待发放，2：未开始   3：进行中，4：已结束，5：暂停")
    private Long status;

    /** 总数量，不超过5000 */
    @Excel(name = "总数量，不超过5000")
    @NotNull(message = "总数量不能为空")
    private Integer totalNum;

    /** 已发行数量，用于判断是否超发 */
    @Excel(name = "已发行数量，用于判断是否超发")
    private Integer issueNum;

    /** 已使用数量 */
    @Excel(name = "已使用数量")
    private Integer usedNum;

    /** 每个人限领的数量，默认1 */
    @Excel(name = "每个人限领的数量，默认1")
    @NotNull(message = "每个人限领的数量不能为空")
    private Integer userLimit;

    /** 创建人 */
    @Excel(name = "创建人")
    private Long creater;

    /** 更新人 */
    @Excel(name = "更新人")
    private Long updater;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

    private Integer isDelete;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @TableField(exist = false)
    private Map<String, Object> params;


    public Map<String, Object> getParams()
    {
        if (params == null)
        {
            params = new HashMap<>();
        }
        return params;
    }

    public void setParams(Map<String, Object> params)
    {
        this.params = params;
    }
    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(Long type)
    {
        this.type = type;
    }

    public Long getType()
    {
        return type;
    }
    public void setDiscountType(Long discountType)
    {
        this.discountType = discountType;
    }

    public Long getDiscountType()
    {
        return discountType;
    }
    public void setThresholdAmount(Long thresholdAmount)
    {
        this.thresholdAmount = thresholdAmount;
    }

    public Long getThresholdAmount() 
    {
        return thresholdAmount;
    }
    public void setObtainWay(Long obtainWay)
    {
        this.obtainWay = obtainWay;
    }

    public Long getObtainWay()
    {
        return obtainWay;
    }
    public void setIssueBeginTime(LocalDateTime issueBeginTime)
    {
        this.issueBeginTime = issueBeginTime;
    }

    public LocalDateTime getIssueBeginTime()
    {
        return issueBeginTime;
    }
    public void setIssueEndTime(LocalDateTime issueEndTime)
    {
        this.issueEndTime = issueEndTime;
    }

    public LocalDateTime getIssueEndTime()
    {
        return issueEndTime;
    }
    public void setTermDays(Long termDays) 
    {
        this.termDays = termDays;
    }

    public Long getTermDays() 
    {
        return termDays;
    }
    public void setTermBeginTime(LocalDateTime termBeginTime)
    {
        this.termBeginTime = termBeginTime;
    }

    public LocalDateTime getTermBeginTime()
    {
        return termBeginTime;
    }
    public void setTermEndTime(LocalDateTime termEndTime)
    {
        this.termEndTime = termEndTime;
    }

    public LocalDateTime getTermEndTime()
    {
        return termEndTime;
    }
    public void setStatus(Long status)
    {
        this.status = status;
    }

    public Long getStatus()
    {
        return status;
    }
    public void setTotalNum(Integer totalNum)
    {
        this.totalNum = totalNum;
    }

    public Integer getTotalNum()
    {
        return totalNum;
    }
    public void setIssueNum(Integer issueNum)
    {
        this.issueNum = issueNum;
    }

    public Integer getIssueNum()
    {
        return issueNum;
    }
    public void setUsedNum(Integer usedNum)
    {
        this.usedNum = usedNum;
    }

    public Integer getUsedNum()
    {
        return usedNum;
    }
    public void setUserLimit(Integer userLimit)
    {
        this.userLimit = userLimit;
    }

    public Integer getUserLimit()
    {
        return userLimit;
    }
    public void setCreater(Long creater) 
    {
        this.creater = creater;
    }

    public Long getCreater() 
    {
        return creater;
    }
    public void setUpdater(Long updater) 
    {
        this.updater = updater;
    }

    public Long getUpdater() 
    {
        return updater;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .append("discountType", getDiscountType())
            .append("thresholdAmount", getThresholdAmount())
            .append("obtainWay", getObtainWay())
            .append("issueBeginTime", getIssueBeginTime())
            .append("issueEndTime", getIssueEndTime())
            .append("termDays", getTermDays())
            .append("termBeginTime", getTermBeginTime())
            .append("termEndTime", getTermEndTime())
            .append("status", getStatus())
            .append("totalNum", getTotalNum())
            .append("issueNum", getIssueNum())
            .append("usedNum", getUsedNum())
            .append("userLimit", getUserLimit())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("creater", getCreater())
            .append("updater", getUpdater())
            .append("isDelete", getIsDelete())
            .toString();
    }
}
