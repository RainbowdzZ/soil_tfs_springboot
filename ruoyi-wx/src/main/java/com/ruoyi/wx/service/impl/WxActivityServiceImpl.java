package com.ruoyi.wx.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.wx.domain.entity.WxActivity;
import com.ruoyi.wx.mapper.WxActivityMapper;
import com.ruoyi.wx.service.IWxActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 活动管理Service业务层处理
 *
 * @author ruoyi
 * @date 2023-11-21
 */
@Service
public class WxActivityServiceImpl  implements IWxActivityService
{
    @Autowired
    private WxActivityMapper wxActivityMapper;

    /**
     * 查询活动管理
     *
     * @param id 活动管理主键
     * @return 活动管理
     */
    @Override
    public WxActivity selectWxActivityById(Long id)
    {
        return wxActivityMapper.selectWxActivityById(id);
    }

    /**
     * 查询活动管理列表
     *
     * @param wxActivity 活动管理
     * @return 活动管理
     */
    @Override
    public List<WxActivity> selectWxActivityList(WxActivity wxActivity)
    {
        return wxActivityMapper.selectWxActivityList(wxActivity);
    }

    /**
     * 新增活动管理
     *
     * @param wxActivity 活动管理
     * @return 结果
     */
    @Override
    public int insertWxActivity(WxActivity wxActivity)
    {
        wxActivity.setCreateTime(DateUtils.getNowDate());
        return wxActivityMapper.insertWxActivity(wxActivity);
    }

    /**
     * 修改活动管理
     *
     * @param wxActivity 活动管理
     * @return 结果
     */
    @Override
    public int updateWxActivity(WxActivity wxActivity)
    {
        wxActivity.setUpdateTime(DateUtils.getNowDate());
        return wxActivityMapper.updateWxActivity(wxActivity);
    }

    /**
     * 批量删除活动管理
     *
     * @param ids 需要删除的活动管理主键
     * @return 结果
     */
    @Override
    public int deleteWxActivityByIds(Long[] ids)
    {
        return wxActivityMapper.deleteWxActivityByIds(ids);
    }



    /**
     * 删除活动管理信息
     *
     * @param id 活动管理主键
     * @return 结果
     */
    @Override
    public int deleteWxActivityById(Long id)
    {
        return wxActivityMapper.deleteWxActivityById(id);
    }

    /**
     * 发布
     */
    public int publishWxActivityById(Long id) {
        WxActivity wxActivity1 =wxActivityMapper.selectWxActivityByStatus(1);
        wxActivity1.setStatus(0);
        wxActivityMapper.updateWxActivity(wxActivity1);
        WxActivity wxActivity = wxActivityMapper.selectWxActivityById(id);
        wxActivity.setStatus(1);
        wxActivity.setUpdateTime(new Date());
        return wxActivityMapper.updateWxActivity(wxActivity);
    }
    /**
     * 停止发布
     */
    public int stopPublishWxActivityById(Long id) {
        WxActivity wxActivity = wxActivityMapper.selectWxActivityById(id);
        wxActivity.setStatus(0);
        wxActivity.setUpdateTime(new Date());
        return wxActivityMapper.updateWxActivity(wxActivity);
    }
}
