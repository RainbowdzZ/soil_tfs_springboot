package com.ruoyi.wx.mapper;

import com.ruoyi.wx.domain.entity.WxActivity;

import java.util.List;

/**
 * 活动管理Mapper接口
 *
 * @author ruoyi
 * @date 2023-11-21
 */
public interface WxActivityMapper
{

    /**
     * 查询活动管理
     *
     * @param id 活动管理主键
     * @return 活动管理
     */
    public WxActivity selectWxActivityById(Long id);
    /**
     * 查询状态
     *
     * @param status 状态
     * @return 活动管理
     */
    public WxActivity selectWxActivityByStatus(int status);

    /**
     * 查询活动管理列表
     *
     * @param wxActivity 活动管理
     * @return 活动管理集合
     */
    public List<WxActivity> selectWxActivityList(WxActivity wxActivity);

    /**
     * 新增活动管理
     *
     * @param wxActivity 活动管理
     * @return 结果
     */
    public int insertWxActivity(WxActivity wxActivity);

    /**
     * 修改活动管理
     *
     * @param wxActivity 活动管理
     * @return 结果
     */
    public int updateWxActivity(WxActivity wxActivity);

    /**
     * 删除活动管理
     *
     * @param id 活动管理主键
     * @return 结果
     */
    public int deleteWxActivityById(Long id);

    /**
     * 批量删除活动管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxActivityByIds(Long[] ids);



}
