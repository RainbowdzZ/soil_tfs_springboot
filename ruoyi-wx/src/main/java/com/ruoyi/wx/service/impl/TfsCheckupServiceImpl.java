package com.ruoyi.wx.service.impl;

import com.ruoyi.wx.domain.entity.TfsCheckup;
import com.ruoyi.wx.mapper.TfsCheckupMapper;
import com.ruoyi.wx.service.ITfsCheckupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TfsCheckupServiceImpl implements ITfsCheckupService {
    @Autowired
    private TfsCheckupMapper tfsCheckupMapper;

    /**
     * 新增检测单
     *
     * @param tfsCheckup 检测单
     * @return 结果
     */
    @Override
    public int insertTfsCheckup(TfsCheckup tfsCheckup)
    {

        return tfsCheckupMapper.insertTfsCheckup(tfsCheckup);
    }

    @Override
    public List<TfsCheckup> selectCheckUpOrder(Long orderId) {
        return tfsCheckupMapper.selectTfsCheckupByOrderId(orderId);
    }


}
