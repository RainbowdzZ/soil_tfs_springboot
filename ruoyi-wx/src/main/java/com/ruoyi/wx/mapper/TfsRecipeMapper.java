package com.ruoyi.wx.mapper;

import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.TfsRecipe;

import java.util.List;

/**
 * 专家配方Mapper接口
 * 
 * @author riki
 * @date 2023-11-03
 */
public interface TfsRecipeMapper 
{
    /**
     * 查询专家配方
     * 
     * @param id 专家配方主键
     * @return 专家配方
     */
    public TfsRecipe selectTfsRecipeByOrderId(Long id);

    /**
     * 查询待专家配方列表
     * 
     * @param tfsOrder 专家配方
     * @return 专家配方集合
     */
//    public List<TfsRecipe> selectTfsRecipeList(TfsRecipe tfsRecipe);
    public List<TfsOrder> selectTfsRecipeOrderList(TfsOrder tfsOrder);

    /**
     * 新增专家配方
     * 
     * @param tfsRecipe 专家配方
     * @return 结果
     */
    public int insertTfsRecipe(TfsRecipe tfsRecipe);

    /**
     * 修改专家配方
     * 
     * @param tfsRecipe 专家配方
     * @return 结果
     */
    public int updateTfsRecipe(TfsRecipe tfsRecipe);

    /**
     * 删除专家配方
     * 
     * @param id 专家配方主键
     * @return 结果
     */
    public int deleteTfsRecipeById(Long id);

    /**
     * 批量删除专家配方
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTfsRecipeByIds(Long[] ids);
}
