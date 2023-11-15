package com.ruoyi.wx.service;

import com.ruoyi.wx.domain.entity.TfsCheckup;

import java.util.List;

public interface ITfsCheckupService {
    /**
     * 新增检测单
     *
     * @param tfsCheckup 检测单
     * @return 结果
     */
    public int insertTfsCheckup(TfsCheckup tfsCheckup);


    List<TfsCheckup> selectCheckUpOrder(Long orderId);
}
