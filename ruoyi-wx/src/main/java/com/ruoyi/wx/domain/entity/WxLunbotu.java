package com.ruoyi.wx.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;


import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 小程序轮播图对象 wx_lunbotu
 * 
 * @author wqb
 * @date 2023-11-15
 */
@TableName("wx_lunbotu")
public class WxLunbotu implements Serializable
{
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 删除标志 默认0 */
    private Long delFlag;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imgUrl;

    /** 名字。富文本或链接的页面标题 */
    @Excel(name = "名字。富文本或链接的页面标题")
    private String name;

    /** 内容类型：1.无(无法点击)；2.富文本；3.链接 */
    @Excel(name = "内容类型：1.无(无法点击)；2.富文本；3.链接")
    private Long contentType;

    /** 根据内容类型定 */
    @Excel(name = "根据内容类型定")
    private String content;

    /** 状态：1.发布；0.未发布 */
    @Excel(name = "状态：1.发布；0.未发布")
    private Long state;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private String createBy;

    private String updateBy;

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

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDelFlag(Long delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Long getDelFlag() 
    {
        return delFlag;
    }
    public void setImgUrl(String imgUrl) 
    {
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() 
    {
        return imgUrl;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setContentType(Long contentType) 
    {
        this.contentType = contentType;
    }

    public Long getContentType() 
    {
        return contentType;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setState(Long state) 
    {
        this.state = state;
    }

    public Long getState() 
    {
        return state;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .append("imgUrl", getImgUrl())
            .append("name", getName())
            .append("contentType", getContentType())
            .append("content", getContent())
            .append("state", getState())
            .append("sort", getSort())
            .toString();
    }
}
