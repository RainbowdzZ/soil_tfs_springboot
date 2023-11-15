package com.ruoyi.wx.domain.entity;

import java.time.LocalDateTime;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 检测指标管理对象 tfs_checkup_indicator
 * 
 * @author riki
 * @date 2023-11-09
 */
public class TfsCheckupIndicator extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检测指标id */
    private Long id;

    /** 检测指标名称 */
    @Excel(name = "检测指标名称")
    private String indicatorName;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime createdAt;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime updatedAt;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setIndicatorName(String indicatorName) 
    {
        this.indicatorName = indicatorName;
    }

    public String getIndicatorName() 
    {
        return indicatorName;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setCreatedAt(LocalDateTime createdAt)
    {
        this.createdAt = createdAt;
    }

    public LocalDateTime getCreatedAt()
    {
        return createdAt;
    }
    public void setUpdatedAt(LocalDateTime updatedAt)
    {
        this.updatedAt = updatedAt;
    }

    public LocalDateTime getUpdatedAt()
    {
        return updatedAt;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("indicatorName", getIndicatorName())
            .append("unit", getUnit())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .append("status", getStatus())
            .toString();
    }
}
