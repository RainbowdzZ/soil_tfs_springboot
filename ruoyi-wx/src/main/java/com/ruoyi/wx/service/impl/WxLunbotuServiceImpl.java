package com.ruoyi.wx.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wx.mapper.WxLunbotuMapper;
import com.ruoyi.wx.domain.entity.WxLunbotu;
import com.ruoyi.wx.service.IWxLunbotuService;

/**
 * 小程序轮播图Service业务层处理
 * 
 * @author wqb
 * @date 2023-11-15
 */
@Service
public class WxLunbotuServiceImpl extends ServiceImpl<WxLunbotuMapper, WxLunbotu> implements IWxLunbotuService
{
    @Autowired
    private WxLunbotuMapper wxLunbotuMapper;

    /**
     * 查询小程序轮播图
     * 
     * @param id 小程序轮播图主键
     * @return 小程序轮播图
     */
    @Override
    public WxLunbotu selectWxLunbotuById(Long id)
    {
        return wxLunbotuMapper.selectWxLunbotuById(id);
    }

    /**
     * 查询小程序轮播图列表
     * 
     * @param wxLunbotu 小程序轮播图
     * @return 小程序轮播图
     */
    @Override
    public List<WxLunbotu> selectWxLunbotuList(WxLunbotu wxLunbotu)
    {
        return wxLunbotuMapper.selectWxLunbotuList(wxLunbotu);
    }

    /**
     * 新增小程序轮播图
     * 
     * @param wxLunbotu 小程序轮播图
     * @return 结果
     */
    @Override
    public int insertWxLunbotu(WxLunbotu wxLunbotu)
    {
        wxLunbotu.setCreateTime(LocalDateTime.now());
        return wxLunbotuMapper.insertWxLunbotu(wxLunbotu);
    }

    /**
     * 修改小程序轮播图
     * 
     * @param wxLunbotu 小程序轮播图
     * @return 结果
     */
    @Override
    public int updateWxLunbotu(WxLunbotu wxLunbotu)
    {
        wxLunbotu.setUpdateTime(LocalDateTime.now());
        return wxLunbotuMapper.updateWxLunbotu(wxLunbotu);
    }

    /**
     * 批量删除小程序轮播图
     * 
     * @param ids 需要删除的小程序轮播图主键
     * @return 结果
     */
    @Override
    public int deleteWxLunbotuByIds(Long[] ids)
    {
        return wxLunbotuMapper.deleteWxLunbotuByIds(ids);
    }

    /**
     * 删除小程序轮播图信息
     * 
     * @param id 小程序轮播图主键
     * @return 结果
     */
    @Override
    public int deleteWxLunbotuById(Long id)
    {
        return wxLunbotuMapper.deleteWxLunbotuById(id);
    }

    @Override
    public int publishWxLunbotuById(Long id) {
        WxLunbotu wxLunbotu = wxLunbotuMapper.selectWxLunbotuById(id);
        wxLunbotu.setState(1L);
        wxLunbotu.setUpdateTime(LocalDateTime.now());
        return wxLunbotuMapper.updateWxLunbotu(wxLunbotu);
    }
}
