package com.ruoyi.wx.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.wx.domain.entity.WxUserFarm;

/**
 * 农场管理Service接口
 * 
 * @author xqb
 * @date 2023-11-08
 */
public interface IWxUserFarmService extends IService<WxUserFarm>
{
    /**
     * 查询农场管理
     * 
     * @param id 农场管理主键
     * @return 农场管理
     */
    public WxUserFarm selectWxUserFarmById(Long id);

    /**
     * 查询农场管理列表
     * 
     * @param wxUserFarm 农场管理
     * @return 农场管理集合
     */
    public List<WxUserFarm> selectWxUserFarmList(WxUserFarm wxUserFarm);

    /**
     * 新增农场管理
     * 
     * @param wxUserFarm 农场管理
     * @return 结果
     */
    public int insertWxUserFarm(WxUserFarm wxUserFarm);

    /**
     * 修改农场管理
     * 
     * @param wxUserFarm 农场管理
     * @return 结果
     */
    public int updateWxUserFarm(WxUserFarm wxUserFarm);

    /**
     * 批量删除农场管理
     * 
     * @param ids 需要删除的农场管理主键集合
     * @return 结果
     */
    public int deleteWxUserFarmByIds(Long[] ids);

    /**
     * 删除农场管理信息
     * 
     * @param id 农场管理主键
     * @return 结果
     */
    public int deleteWxUserFarmById(Long id);

    void setDefault(Long farmId);
}
