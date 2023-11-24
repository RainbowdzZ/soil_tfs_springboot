package com.ruoyi.wx.service.impl;

import com.ruoyi.wx.domain.entity.TfsCheckup;
import com.ruoyi.wx.domain.entity.TfsCheckupIndicator;
import com.ruoyi.wx.mapper.TfsCheckupIndicatorMapper;
import com.ruoyi.wx.mapper.TfsCheckupMapper;
import com.ruoyi.wx.service.ITfsCheckupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class TfsCheckupServiceImpl implements ITfsCheckupService {
    @Autowired
    private TfsCheckupMapper tfsCheckupMapper;
    @Autowired
    private TfsCheckupIndicatorMapper tfsCheckupIndicatorMapper;

    /**
     * 新增检测单
     *
     * @param tfsCheckup 检测单
     * @return 结果
     */
    @Override
    public int insertTfsCheckup(TfsCheckup tfsCheckup)
    {

        BigDecimal checkupValue = tfsCheckup.getCheckupValue();
        if (checkupValue == null) {
            // 可以抛出异常或者设置默认值，具体取决于你的业务需求
            throw new IllegalArgumentException("checkupValue cannot be null");
            // 或者设置默认值
            // checkupValue = BigDecimal.ZERO;
        }

        TfsCheckupIndicator tfsCheckupIndicator = tfsCheckupIndicatorMapper.selectTfsCheckupIndicatorById(tfsCheckup.getCheckupIndicatorId());
        if (tfsCheckupIndicator == null) {
            // 处理 tfsCheckupIndicator 为 null 的情况，可以抛出异常或者设置默认值
            throw new IllegalArgumentException("tfsCheckupIndicator cannot be null");
            // 或者设置默认值
            // tfsCheckupIndicator = new TfsCheckupIndicator();
        }
        if (checkupValue.compareTo(tfsCheckupIndicator.getLevel1Min()) >= 0 && checkupValue.compareTo(tfsCheckupIndicator.getLevel1Max()) <= 0) {
            tfsCheckup.setLevel(1); // 一级
        } else if (checkupValue.compareTo(tfsCheckupIndicator.getLevel2Min()) >= 0 && checkupValue.compareTo(tfsCheckupIndicator.getLevel2Max()) <= 0) {
            tfsCheckup.setLevel(2); // 二级
        } else if (checkupValue.compareTo(tfsCheckupIndicator.getLevel3Min()) >= 0 && checkupValue.compareTo(tfsCheckupIndicator.getLevel3Max()) <= 0) {
            tfsCheckup.setLevel(3); // 三级
        } else if (checkupValue.compareTo(tfsCheckupIndicator.getLevel4Min()) >= 0 && checkupValue.compareTo(tfsCheckupIndicator.getLevel4Max()) <= 0) {
            tfsCheckup.setLevel(4); // 四级
        } else if (checkupValue.compareTo(tfsCheckupIndicator.getLevel5Min()) >= 0 && checkupValue.compareTo(tfsCheckupIndicator.getLevel5Max()) <= 0) {
            tfsCheckup.setLevel(5); // 五级
        } else {
            // 如果不在上述范围内，可以设置默认的级别或者抛出异常，具体取决于你的需求。
        }

        return tfsCheckupMapper.insertTfsCheckup(tfsCheckup);
    }

    @Override
    public List<TfsCheckup> selectCheckUpOrder(Long orderId) {
        return tfsCheckupMapper.selectTfsCheckupByOrderId(orderId);
    }


}
