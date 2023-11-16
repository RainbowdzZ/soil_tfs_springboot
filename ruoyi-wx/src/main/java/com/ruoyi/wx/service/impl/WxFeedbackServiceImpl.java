package com.ruoyi.wx.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wx.mapper.WxFeedbackMapper;
import com.ruoyi.wx.domain.entity.WxFeedback;
import com.ruoyi.wx.service.IWxFeedbackService;

/**
 * 用户反馈Service业务层处理
 * 
 * @author xqb
 * @date 2023-11-16
 */
@Service
public class WxFeedbackServiceImpl extends ServiceImpl<WxFeedbackMapper, WxFeedback> implements IWxFeedbackService
{
    @Autowired
    private WxFeedbackMapper wxFeedbackMapper;

    /**
     * 查询用户反馈
     * 
     * @param id 用户反馈主键
     * @return 用户反馈
     */
    @Override
    public WxFeedback selectWxFeedbackById(String id)
    {
        return wxFeedbackMapper.selectWxFeedbackById(id);
    }

    /**
     * 查询用户反馈列表
     * 
     * @param wxFeedback 用户反馈
     * @return 用户反馈
     */
    @Override
    public List<WxFeedback> selectWxFeedbackList(WxFeedback wxFeedback)
    {
        return wxFeedbackMapper.selectWxFeedbackList(wxFeedback);
    }

    /**
     * 新增用户反馈
     * 
     * @param wxFeedback 用户反馈
     * @return 结果
     */
    @Override
    public int insertWxFeedback(WxFeedback wxFeedback)
    {
        wxFeedback.setCreateTime(LocalDateTime.now());
        return wxFeedbackMapper.insertWxFeedback(wxFeedback);
    }

    /**
     * 修改用户反馈
     * 
     * @param wxFeedback 用户反馈
     * @return 结果
     */
    @Override
    public int updateWxFeedback(WxFeedback wxFeedback)
    {
        wxFeedback.setUpdateTime(LocalDateTime.now());
        return wxFeedbackMapper.updateWxFeedback(wxFeedback);
    }

    /**
     * 批量删除用户反馈
     * 
     * @param ids 需要删除的用户反馈主键
     * @return 结果
     */
    @Override
    public int deleteWxFeedbackByIds(String[] ids)
    {
        return wxFeedbackMapper.deleteWxFeedbackByIds(ids);
    }

    /**
     * 删除用户反馈信息
     * 
     * @param id 用户反馈主键
     * @return 结果
     */
    @Override
    public int deleteWxFeedbackById(String id)
    {
        return wxFeedbackMapper.deleteWxFeedbackById(id);
    }
}
