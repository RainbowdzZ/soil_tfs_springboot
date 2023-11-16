package com.ruoyi.wx.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.domain.entity.WxUserFarm;
import com.ruoyi.wx.enums.IsDeleteConstant;
import com.ruoyi.wx.service.IWxUserFarmService;
import com.ruoyi.wx.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/wx")
public class WxFarmUserContoller extends BaseController {


    @Autowired
    private IWxUserFarmService wxUserFarmService;
    /**
     * 新增农户地址
     */
    @PostMapping("/farmUser/save")
    public AjaxResult addAddress(@RequestBody @Validated WxUserFarm wxUserFarm){
        wxUserFarm.setUserId(UserContext.getUser());
        return toAjax(wxUserFarmService.insertWxUserFarm(wxUserFarm));
    }

    /**
     * 查询当前用户的全部地址
     */
    @GetMapping("/farmUser/list")
    public AjaxResult list(){
        WxUserFarm wxUserFarm = new WxUserFarm();
        wxUserFarm.setUserId(UserContext.getUser());
        wxUserFarm.setIsDeleted(IsDeleteConstant.NO.getCode());
        return AjaxResult.success(wxUserFarmService.selectWxUserFarmList(wxUserFarm));
    }

    /**
     * 删除农户地址
     */
    @DeleteMapping("/farmUser/{farmId}")
    public AjaxResult delete(@PathVariable("farmId") Long farmId){
        return toAjax(wxUserFarmService.deleteWxUserFarmById(farmId));
    }

    /**
     * 修改农户地址
     */
    @PutMapping("/farmUser/edit")
    public AjaxResult edit(@RequestBody WxUserFarm wxUserFarm)
    {

        return toAjax(wxUserFarmService.updateWxUserFarm(wxUserFarm));
    }

    /**
     * 设置默认地址
     */
    @PutMapping("/farmUser/setDefault/{farmId}")
    public AjaxResult setDefault(@PathVariable("farmId") Long farmId){
        wxUserFarmService.setDefault(farmId);
        return AjaxResult.success();
    }

}
