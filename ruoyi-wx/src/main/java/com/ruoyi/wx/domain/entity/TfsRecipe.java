package com.ruoyi.wx.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 专家配方对象 tfs_recipe
 * 
 * @author riki
 * @date 2023-11-03
 */
@TableName("tfs_recipe")
public class TfsRecipe implements Serializable
{
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 配方号 */
    @Excel(name = "配方号")
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private Long orderId;

    /** 施肥建议 */
    @Excel(name = "施肥建议")
    @NotEmpty(message = "施肥建议不能为空")
    private String fertilizationAdvice;

    /** 种植建议 */
    @Excel(name = "种植建议")
    @NotEmpty(message = "种植建议不能为空")
    private String plantingAdvice;

    /** 总结 */
    @Excel(name = "总结")
    @NotEmpty(message = "总结不能为空")
    private String summary;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

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
    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }
    public void setFertilizationAdvice(String fertilizationAdvice) 
    {
        this.fertilizationAdvice = fertilizationAdvice;
    }

    public String getFertilizationAdvice() 
    {
        return fertilizationAdvice;
    }
    public void setPlantingAdvice(String plantingAdvice) 
    {
        this.plantingAdvice = plantingAdvice;
    }

    public String getPlantingAdvice() 
    {
        return plantingAdvice;
    }
    public void setSummary(String summary) 
    {
        this.summary = summary;
    }

    public String getSummary() 
    {
        return summary;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("fertilizationAdvice", getFertilizationAdvice())
            .append("plantingAdvice", getPlantingAdvice())
            .append("summary", getSummary())
            .toString();
    }
}
