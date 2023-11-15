package com.ruoyi.wx.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.domain.entity.WxUser;
import com.ruoyi.wx.service.IWxUserService;
import com.ruoyi.wx.web.service.WxTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wx")
public class WxUserInfoController extends BaseController {


    @Autowired
    private WxTokenService wxTokenService;

    @Autowired
    private IWxUserService wxUserService;
    @PutMapping("/wxUserInfo")
    public AjaxResult edit(@RequestBody WxUser wxUser)
    {
         return toAjax(wxUserService.updateWxUser(wxUser));
    }

}
