package com.ruoyi.wx.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.domain.entity.WxFeedback;
import com.ruoyi.wx.service.IWxFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wx/feed")
public class WxFeedBackController {

    @Autowired
    private IWxFeedbackService wxFeedbackService;

    @PostMapping("/save")
    public AjaxResult addFeedBack(@RequestBody @Validated WxFeedback wxFeedback){

        try {
            wxFeedbackService.insertWxFeedback(wxFeedback);
            return AjaxResult.success("反馈成功");
        }catch (Exception e){
            return AjaxResult.error("反馈失败");
        }

    }
}
