package com.ruoyi.wx.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 检测指标管理对象 tfs_checkup_indicator
 *
 * @author ruoyi
 * @date 2023-11-23
 */
public class TfsCheckupIndicator extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检测指标号 */
    private Long id;

    /** 指标名称 */
    @Excel(name = "指标名称")
    private String indicatorName;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createdAt;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date updatedAt;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 1级最小值 */
    private BigDecimal level1Min;

    /** 1级最大值 */
    private BigDecimal level1Max;

    /** 2级最小值 */
    private BigDecimal level2Min;

    /** 2级最大值 */
    private BigDecimal level2Max;

    /** 3级最小值 */
    private BigDecimal level3Min;

    /** 3级最大值 */
    private BigDecimal level3Max;

    /** 1级最小值 */
    private BigDecimal level4Min;

    /** 4级最大值 */
    private BigDecimal level4Max;

    /** 5级最小值 */
    private BigDecimal level5Min;

    /** 5级最大值 */
    private BigDecimal level5Max;

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
    public void setCreatedAt(Date createdAt)
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt()
    {
        return createdAt;
    }
    public void setUpdatedAt(Date updatedAt)
    {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedAt()
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
    public void setLevel1Min(BigDecimal level1Min)
    {
        this.level1Min = level1Min;
    }

    public BigDecimal getLevel1Min()
    {
        return level1Min;
    }
    public void setLevel1Max(BigDecimal level1Max)
    {
        this.level1Max = level1Max;
    }

    public BigDecimal getLevel1Max()
    {
        return level1Max;
    }
    public void setLevel2Min(BigDecimal level2Min)
    {
        this.level2Min = level2Min;
    }

    public BigDecimal getLevel2Min()
    {
        return level2Min;
    }
    public void setLevel2Max(BigDecimal level2Max)
    {
        this.level2Max = level2Max;
    }

    public BigDecimal getLevel2Max()
    {
        return level2Max;
    }
    public void setLevel3Min(BigDecimal level3Min)
    {
        this.level3Min = level3Min;
    }

    public BigDecimal getLevel3Min()
    {
        return level3Min;
    }
    public void setLevel3Max(BigDecimal level3Max)
    {
        this.level3Max = level3Max;
    }

    public BigDecimal getLevel3Max()
    {
        return level3Max;
    }
    public void setLevel4Min(BigDecimal level4Min)
    {
        this.level4Min = level4Min;
    }

    public BigDecimal getLevel4Min()
    {
        return level4Min;
    }
    public void setLevel4Max(BigDecimal level4Max)
    {
        this.level4Max = level4Max;
    }

    public BigDecimal getLevel4Max()
    {
        return level4Max;
    }
    public void setLevel5Min(BigDecimal level5Min)
    {
        this.level5Min = level5Min;
    }

    public BigDecimal getLevel5Min()
    {
        return level5Min;
    }
    public void setLevel5Max(BigDecimal level5Max)
    {
        this.level5Max = level5Max;
    }

    public BigDecimal getLevel5Max()
    {
        return level5Max;
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
                .append("level1Min", getLevel1Min())
                .append("level1Max", getLevel1Max())
                .append("level2Min", getLevel2Min())
                .append("level2Max", getLevel2Max())
                .append("level3Min", getLevel3Min())
                .append("level3Max", getLevel3Max())
                .append("level4Min", getLevel4Min())
                .append("level4Max", getLevel4Max())
                .append("level5Min", getLevel5Min())
                .append("level5Max", getLevel5Max())
                .toString();
    }
}
