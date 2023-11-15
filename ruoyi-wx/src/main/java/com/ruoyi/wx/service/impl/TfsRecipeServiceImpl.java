package com.ruoyi.wx.service.impl;

import com.ruoyi.wx.domain.entity.TfsCheckup;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.TfsRecipe;
import com.ruoyi.wx.domain.entity.WxUserFarm;
import com.ruoyi.wx.domain.vo.ExpertLookVO;
import com.ruoyi.wx.mapper.TfsCheckupMapper;
import com.ruoyi.wx.mapper.TfsOrderMapper;
import com.ruoyi.wx.mapper.TfsRecipeMapper;
import com.ruoyi.wx.service.ITfsOrderService;
import com.ruoyi.wx.service.ITfsRecipeService;
import com.ruoyi.wx.service.IWxUserFarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 专家配方Service业务层处理
 * 
 * @author riki
 * @date 2023-11-03
 */
@Service
public class TfsRecipeServiceImpl implements ITfsRecipeService 
{
    @Autowired
    private TfsRecipeMapper tfsRecipeMapper;

    @Autowired
    private ITfsOrderService tfsOrderService;

    @Autowired
    private IWxUserFarmService wxUserFarmService;

    @Autowired
    private TfsCheckupMapper tfsCheckupMapper;

    /**
     * 查询专家配方
     * 
     * @param id 专家配方主键
     * @return 专家配方
     */
    @Override
    public TfsRecipe selectTfsRecipeByOrderId(Long id)
    {
        return tfsRecipeMapper.selectTfsRecipeByOrderId(id);
    }

    /**
     * 查询待专家配方的订单列表
     * 
     * @param tfsOrder 待专家配方的列表
     * @return 专家配方
     */
//    @Override
//    public List<TfsRecipe> selectTfsRecipeList(TfsRecipe tfsRecipe)
//    {
//        return tfsRecipeMapper.selectTfsRecipeList(tfsRecipe);
//    }
        @Override
        public List<TfsOrder> selectTfsRecipeOrderList(TfsOrder tfsOrder)
        {


            return tfsRecipeMapper.selectTfsRecipeOrderList(tfsOrder);
        }

    /**
     * 新增专家配方
     * 
     * @param tfsRecipe 专家配方
     * @return 结果
     */
    @Override
    public int insertTfsRecipe(TfsRecipe tfsRecipe)
    {
        tfsRecipe.setCreateTime(LocalDateTime.now());
        return tfsRecipeMapper.insertTfsRecipe(tfsRecipe);
    }

    /**
     * 修改专家配方
     * 
     * @param tfsRecipe 专家配方
     * @return 结果
     */
    @Override
    public int updateTfsRecipe(TfsRecipe tfsRecipe)
    {

        tfsRecipe.setUpdateTime(LocalDateTime.now());
        return tfsRecipeMapper.updateTfsRecipe(tfsRecipe);
    }

    /**
     * 批量删除专家配方
     * 
     * @param ids 需要删除的专家配方主键
     * @return 结果
     */
    @Override
    public int deleteTfsRecipeByIds(Long[] ids)
    {
        return tfsRecipeMapper.deleteTfsRecipeByIds(ids);
    }

    /**
     * 删除专家配方信息
     * 
     * @param id 专家配方主键
     * @return 结果
     */
    @Override
    public int deleteTfsRecipeById(Long id)
    {
        return tfsRecipeMapper.deleteTfsRecipeById(id);
    }

    @Override
    public TfsRecipe selectRecipeOrder(Long orderId) {
        return tfsRecipeMapper.selectTfsRecipeByOrderId(orderId);
    }

    @Override
    public ExpertLookVO selectExpertLook(Long id) {
        TfsOrder order = tfsOrderService.selectTfsOrderById(id);
        List<TfsCheckup> tfsCheckups = tfsCheckupMapper.selectTfsCheckupByOrderId(id);
        WxUserFarm farm = wxUserFarmService.selectWxUserFarmById(order.getFarmId());

        ExpertLookVO expertLookVO = new ExpertLookVO();
        expertLookVO.setSoilUrl(order.getSoilUrl());
        expertLookVO.setTfsCheckupList(tfsCheckups);
        expertLookVO.setAddress(order.getAddress());
        expertLookVO.setPlantCategory(farm.getPlantCategory());
        expertLookVO.setScale(farm.getScale());
        return expertLookVO;
    }


}
