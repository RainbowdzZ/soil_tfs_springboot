package com.ruoyi.web.controller.tfs;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.domain.dto.HomeDto;
import com.ruoyi.wx.mapper.TfsHomeMapper;
import com.ruoyi.wx.service.ITfsHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/home")
public class TfsHomeController extends BaseController {

    @Autowired
    private ITfsHomeService tfsHomeService;
    @Autowired
    private TfsHomeMapper tfsHomeMapper;
    @PreAuthorize("@ss.hasPermi('tfs:index:home')")
    @GetMapping
    public AjaxResult homeData(int type){
        HomeDto homeDto = new HomeDto();
        HomeDto.DataCount dataCount = new HomeDto.DataCount();
        dataCount.setOrderCount(tfsHomeService.CountTodayOrders());
        dataCount.setUtSoilCount(tfsHomeService.CountStatusOrders(type));
        dataCount.setUserCount(tfsHomeService.CountUsers());
        homeDto.setDataCount(dataCount);

        homeDto.setWeek(tfsHomeService.CountWeek());
        homeDto.setMonth(tfsHomeService.CountMonth());
        homeDto.setYear(tfsHomeService.CountYear());

        return AjaxResult.success(homeDto);

    }
}
