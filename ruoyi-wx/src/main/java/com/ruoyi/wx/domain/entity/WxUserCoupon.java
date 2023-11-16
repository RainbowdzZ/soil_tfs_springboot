package com.ruoyi.wx.domain.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import com.alibaba.fastjson2.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 优惠券历史对象 wx_user_coupon
 * 
 * @author xqb
 * @date 2023-11-06
 */
@TableName("wx_user_coupon")
public class WxUserCoupon implements Serializable
{
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** id */
    @TableId(value = "id",type = IdType.ASSIGN_ID)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
//    @JSONField(serializeUsing= ToStringSerializer.class)
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 优惠券id */
    @Excel(name = "优惠券id")
    private Long couponId;

    /** 有效期开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "有效期开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime termBeginTime;

    /** 有效期结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "有效期结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime termEndTime;

    /** 使用时间（核销时间） */
    @Excel(name = "使用时间", readConverterExp = "核=销时间")
    private LocalDateTime usedTime;


    /** 优惠券状态，1：未使用，2：已使用，3：已失效 */
    @Excel(name = "优惠券状态，1：未使用，2：已使用，3：已失效")
    private Long status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

    /** 订单id */
    @Excel(name = "订单id")
    private Long orderId;

    private Integer isDelete;

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setCouponId(Long couponId) 
    {
        this.couponId = couponId;
    }

    public Long getCouponId() 
    {
        return couponId;
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
    public void setUsedTime(LocalDateTime usedTime)
    {
        this.usedTime = usedTime;
    }

    public LocalDateTime getUsedTime()
    {
        return usedTime;
    }
    public void setStatus(Long status)
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
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


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("couponId", getCouponId())
            .append("termBeginTime", getTermBeginTime())
            .append("termEndTime", getTermEndTime())
            .append("usedTime", getUsedTime())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("orderId", getOrderId())
            .append("isDelete", getIsDelete())
            .toString();
    }
}
