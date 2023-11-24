package com.ruoyi.wx.service.impl;

import com.ruoyi.wx.domain.entity.TfsCheckupIndicator;
import com.ruoyi.wx.mapper.TfsCheckupIndicatorMapper;
import com.ruoyi.wx.service.ITfsCheckupIndicatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * 检测指标管理Service业务层处理
 *
 * @author ruoyi
 * @date 2023-11-23
 */
@Service
public class TfsCheckupIndicatorServiceImpl implements ITfsCheckupIndicatorService
{
    @Autowired
    private TfsCheckupIndicatorMapper tfsCheckupIndicatorMapper;

    /**
     * 查询检测指标管理
     *
     * @param id 检测指标管理主键
     * @return 检测指标管理
     */
    @Override
    public TfsCheckupIndicator selectTfsCheckupIndicatorById(Long id)
    {
        return tfsCheckupIndicatorMapper.selectTfsCheckupIndicatorById(id);
    }

    /**
     * 查询检测指标管理列表
     *
     * @param tfsCheckupIndicator 检测指标管理
     * @return 检测指标管理
     */
    @Override
    public List<TfsCheckupIndicator> selectTfsCheckupIndicatorList(TfsCheckupIndicator tfsCheckupIndicator)
    {
        return tfsCheckupIndicatorMapper.selectTfsCheckupIndicatorList(tfsCheckupIndicator);
    }

    /**
     * 新增检测指标管理
     *
     * @param tfsCheckupIndicator 检测指标管理
     * @return 结果
     */
    @Override
    public int insertTfsCheckupIndicator(TfsCheckupIndicator tfsCheckupIndicator)
    {
        return tfsCheckupIndicatorMapper.insertTfsCheckupIndicator(tfsCheckupIndicator);
    }

    /**
     * 修改检测指标管理
     *
     * @param tfsCheckupIndicator 检测指标管理
     * @return 结果
     */
    @Override
    public int updateTfsCheckupIndicator(TfsCheckupIndicator tfsCheckupIndicator)
    {
        tfsCheckupIndicator.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
        return tfsCheckupIndicatorMapper.updateTfsCheckupIndicator(tfsCheckupIndicator);
    }

    /**
     * 批量删除检测指标管理
     *
     * @param ids 需要删除的检测指标管理主键
     * @return 结果
     */
    @Override
    public int deleteTfsCheckupIndicatorByIds(Long[] ids)
    {
        return tfsCheckupIndicatorMapper.deleteTfsCheckupIndicatorByIds(ids);
    }

    /**
     * 删除检测指标管理信息
     *
     * @param id 检测指标管理主键
     * @return 结果
     */
    @Override
    public int deleteTfsCheckupIndicatorById(Long id)
    {
        return tfsCheckupIndicatorMapper.deleteTfsCheckupIndicatorById(id);
    }
}
