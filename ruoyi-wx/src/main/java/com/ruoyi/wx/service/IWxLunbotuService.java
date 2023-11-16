package com.ruoyi.wx.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.wx.domain.entity.WxLunbotu;

/**
 * 小程序轮播图Service接口
 * 
 * @author wqb
 * @date 2023-11-15
 */
public interface IWxLunbotuService extends IService<WxLunbotu>
{
    /**
     * 查询小程序轮播图
     * 
     * @param id 小程序轮播图主键
     * @return 小程序轮播图
     */
    public WxLunbotu selectWxLunbotuById(Long id);

    /**
     * 查询小程序轮播图列表
     * 
     * @param wxLunbotu 小程序轮播图
     * @return 小程序轮播图集合
     */
    public List<WxLunbotu> selectWxLunbotuList(WxLunbotu wxLunbotu);

    /**
     * 新增小程序轮播图
     * 
     * @param wxLunbotu 小程序轮播图
     * @return 结果
     */
    public int insertWxLunbotu(WxLunbotu wxLunbotu);

    /**
     * 修改小程序轮播图
     * 
     * @param wxLunbotu 小程序轮播图
     * @return 结果
     */
    public int updateWxLunbotu(WxLunbotu wxLunbotu);

    /**
     * 批量删除小程序轮播图
     * 
     * @param ids 需要删除的小程序轮播图主键集合
     * @return 结果
     */
    public int deleteWxLunbotuByIds(Long[] ids);

    /**
     * 删除小程序轮播图信息
     * 
     * @param id 小程序轮播图主键
     * @return 结果
     */
    public int deleteWxLunbotuById(Long id);

    int publishWxLunbotuById(Long id);
}
