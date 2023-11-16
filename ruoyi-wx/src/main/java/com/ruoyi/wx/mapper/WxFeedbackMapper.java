package com.ruoyi.wx.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.wx.domain.entity.WxFeedback;

/**
 * 用户反馈Mapper接口
 * 
 * @author xqb
 * @date 2023-11-16
 */
public interface WxFeedbackMapper extends BaseMapper<WxFeedback>
{
    /**
     * 查询用户反馈
     * 
     * @param id 用户反馈主键
     * @return 用户反馈
     */
    public WxFeedback selectWxFeedbackById(String id);

    /**
     * 查询用户反馈列表
     * 
     * @param wxFeedback 用户反馈
     * @return 用户反馈集合
     */
    public List<WxFeedback> selectWxFeedbackList(WxFeedback wxFeedback);

    /**
     * 新增用户反馈
     * 
     * @param wxFeedback 用户反馈
     * @return 结果
     */
    public int insertWxFeedback(WxFeedback wxFeedback);

    /**
     * 修改用户反馈
     * 
     * @param wxFeedback 用户反馈
     * @return 结果
     */
    public int updateWxFeedback(WxFeedback wxFeedback);

    /**
     * 删除用户反馈
     * 
     * @param id 用户反馈主键
     * @return 结果
     */
    public int deleteWxFeedbackById(String id);

    /**
     * 批量删除用户反馈
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxFeedbackByIds(String[] ids);
}
