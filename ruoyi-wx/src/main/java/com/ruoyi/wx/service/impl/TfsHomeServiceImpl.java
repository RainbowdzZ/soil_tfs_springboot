package com.ruoyi.wx.service.impl;
import com.ruoyi.wx.domain.dto.HomeDto;
import com.ruoyi.wx.mapper.TfsHomeMapper;
import com.ruoyi.wx.service.ITfsHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TfsHomeServiceImpl implements ITfsHomeService {
    @Autowired
    private TfsHomeMapper tfsHomeMapper;


    @Override
    public int CountTodayOrders() {
        return tfsHomeMapper.selectCountTodayOrders();
    }

    @Override
    public int CountStatusOrders(int type) {
        return tfsHomeMapper.selectCountStatusOrders(type);
    }

    @Override
    public int CountUsers() {
        return tfsHomeMapper.selectCountUsers();
    }

    @Override
    public int CountFeedback() {
        return tfsHomeMapper.selectCountFeedback();
    }

    @Override
    public List<HomeDto.DateCount> CountWeek() {
        return tfsHomeMapper.selectCountWeekOrders();
    }

    @Override
    public List<HomeDto.DateCount> CountMonth() {
        return tfsHomeMapper.selectCountMonthOrders();
    }

    @Override
    public List<HomeDto.DateCount> CountYear() {
        return tfsHomeMapper.selectCountYearOrders();
    }
}
