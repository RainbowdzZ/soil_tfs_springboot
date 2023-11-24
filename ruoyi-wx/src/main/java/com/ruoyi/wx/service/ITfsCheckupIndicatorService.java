package com.ruoyi.wx.service;

import com.ruoyi.wx.domain.entity.TfsCheckupIndicator;

import java.util.List;

/**
 * 检测指标管理Service接口
 *
 * @author ruoyi
 * @date 2023-11-23
 */
public interface ITfsCheckupIndicatorService
{
    /**
     * 查询检测指标管理
     *
     * @param id 检测指标管理主键
     * @return 检测指标管理
     */
    public TfsCheckupIndicator selectTfsCheckupIndicatorById(Long id);

    /**
     * 查询检测指标管理列表
     *
     * @param tfsCheckupIndicator 检测指标管理
     * @return 检测指标管理集合
     */
    public List<TfsCheckupIndicator> selectTfsCheckupIndicatorList(TfsCheckupIndicator tfsCheckupIndicator);

    /**
     * 新增检测指标管理
     *
     * @param tfsCheckupIndicator 检测指标管理
     * @return 结果
     */
    public int insertTfsCheckupIndicator(TfsCheckupIndicator tfsCheckupIndicator);

    /**
     * 修改检测指标管理
     *
     * @param tfsCheckupIndicator 检测指标管理
     * @return 结果
     */
    public int updateTfsCheckupIndicator(TfsCheckupIndicator tfsCheckupIndicator);

    /**
     * 批量删除检测指标管理
     *
     * @param ids 需要删除的检测指标管理主键集合
     * @return 结果
     */
    public int deleteTfsCheckupIndicatorByIds(Long[] ids);

    /**
     * 删除检测指标管理信息
     *
     * @param id 检测指标管理主键
     * @return 结果
     */
    public int deleteTfsCheckupIndicatorById(Long id);
}
