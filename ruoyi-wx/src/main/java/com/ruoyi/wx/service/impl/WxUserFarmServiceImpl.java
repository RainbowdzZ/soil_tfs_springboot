package com.ruoyi.wx.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.wx.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wx.mapper.WxUserFarmMapper;
import com.ruoyi.wx.domain.entity.WxUserFarm;
import com.ruoyi.wx.service.IWxUserFarmService;

/**
 * 农场管理Service业务层处理
 * 
 * @author xqb
 * @date 2023-11-08
 */
@Service
public class WxUserFarmServiceImpl extends ServiceImpl<WxUserFarmMapper, WxUserFarm> implements IWxUserFarmService
{
    @Autowired
    private WxUserFarmMapper wxUserFarmMapper;

    /**
     * 查询农场管理
     * 
     * @param id 农场管理主键
     * @return 农场管理
     */
    @Override
    public WxUserFarm selectWxUserFarmById(Long id)
    {
        return wxUserFarmMapper.selectWxUserFarmById(id);
    }

    /**
     * 查询农场管理列表
     * 
     * @param wxUserFarm 农场管理
     * @return 农场管理
     */
    @Override
    public List<WxUserFarm> selectWxUserFarmList(WxUserFarm wxUserFarm)
    {
        return wxUserFarmMapper.selectWxUserFarmList(wxUserFarm);
    }

    /**
     * 新增农场管理
     * 
     * @param wxUserFarm 农场管理
     * @return 结果
     */
    @Override
    public int insertWxUserFarm(WxUserFarm wxUserFarm)
    {
        wxUserFarm.setCreateTime(LocalDateTime.now());
        return wxUserFarmMapper.insertWxUserFarm(wxUserFarm);
    }

    /**
     * 修改农场管理
     * 
     * @param wxUserFarm 农场管理
     * @return 结果
     */
    @Override
    public int updateWxUserFarm(WxUserFarm wxUserFarm)
    {
        wxUserFarm.setUpdateTime(LocalDateTime.now());
        return wxUserFarmMapper.updateWxUserFarm(wxUserFarm);
    }

    /**
     * 批量删除农场管理
     * 
     * @param ids 需要删除的农场管理主键
     * @return 结果
     */
    @Override
    public int deleteWxUserFarmByIds(Long[] ids)
    {
        return wxUserFarmMapper.deleteWxUserFarmByIds(ids);
    }

    /**
     * 删除农场管理信息
     * 
     * @param id 农场管理主键
     * @return 结果
     */
    @Override
    public int deleteWxUserFarmById(Long id)
    {
        return wxUserFarmMapper.deleteWxUserFarmById(id);
    }

    @Override
    public void setDefault(Long farmId) {
       //1.将当前用户的所有地址状态设为0
        wxUserFarmMapper.updateStatusByUserId(UserContext.getUser());
        //2.将指定id的地址状态设为1
        wxUserFarmMapper.updateStatusById(farmId);
    }
}
