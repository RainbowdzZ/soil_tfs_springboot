package com.ruoyi.wx.domain.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 农场管理对象 wx_user_farm
 * 
 * @author xqb
 * @date 2023-11-08
 */
@TableName("wx_user_farm")
public class WxUserFarm implements Serializable
{
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** id */
    @TableId(value = "id")
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 收件人 */
    @Excel(name = "收件人")
    @NotEmpty(message = "收件人不能为空")
    private String consignee;

    /** 手机号 */
    @Excel(name = "手机号")
    @NotEmpty(message = "手机号不能为空")
    @Pattern(regexp = "^[0-9]{11}$", message = "手机号必须是11位数字")
    private String phone;

    /** 省级名称 */
    @Excel(name = "省级名称")
    private String provinceName;

    /** 市级名称 */
    @Excel(name = "市级名称")
    private String cityName;

    /** 区级名称 */
    @Excel(name = "区级名称")
    private String districtName;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String detail;

    /** 默认地址 0否1是 */
    @Excel(name = "默认地址 0否1是")
    private Integer isDefault;

    /** 种植种类 */
    @Excel(name = "种植种类")
    @NotEmpty(message = "种植种类不能为空")
    private String plantCategory;

    /** 种植规模 */
    @Excel(name = "种植规模")
    @NotEmpty(message = "种植规模不能为空")
    private String scale;

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

    /** 是否删除 0否1是 */
    @Excel(name = "是否删除 0否1是")
    private Integer isDeleted;

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
    public void setConsignee(String consignee) 
    {
        this.consignee = consignee;
    }

    public String getConsignee() 
    {
        return consignee;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setProvinceName(String provinceName) 
    {
        this.provinceName = provinceName;
    }

    public String getProvinceName() 
    {
        return provinceName;
    }
    public void setCityName(String cityName) 
    {
        this.cityName = cityName;
    }

    public String getCityName() 
    {
        return cityName;
    }
    public void setDistrictName(String districtName) 
    {
        this.districtName = districtName;
    }

    public String getDistrictName() 
    {
        return districtName;
    }
    public void setDetail(String detail) 
    {
        this.detail = detail;
    }

    public String getDetail() 
    {
        return detail;
    }
    public void setIsDefault(Integer isDefault) 
    {
        this.isDefault = isDefault;
    }

    public Integer getIsDefault() 
    {
        return isDefault;
    }
    public void setPlantCategory(String plantCategory) 
    {
        this.plantCategory = plantCategory;
    }

    public String getPlantCategory() 
    {
        return plantCategory;
    }
    public void setScale(String scale) 
    {
        this.scale = scale;
    }

    public String getScale() 
    {
        return scale;
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
    public void setIsDeleted(Integer isDeleted) 
    {
        this.isDeleted = isDeleted;
    }

    public Integer getIsDeleted() 
    {
        return isDeleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("consignee", getConsignee())
            .append("phone", getPhone())
            .append("provinceName", getProvinceName())
            .append("cityName", getCityName())
            .append("districtName", getDistrictName())
            .append("detail", getDetail())
            .append("isDefault", getIsDefault())
            .append("plantCategory", getPlantCategory())
            .append("scale", getScale())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("creater", getCreater())
            .append("updater", getUpdater())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
