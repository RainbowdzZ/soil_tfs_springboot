package com.ruoyi.wx.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.service.ISysNoticeService;
import com.ruoyi.wx.domain.entity.WxActivity;
import com.ruoyi.wx.domain.entity.WxLunbotu;
import com.ruoyi.wx.service.IWxActivityService;
import com.ruoyi.wx.service.IWxLunbotuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/wx/home")
public class WxHomeContoller {

    @Autowired
    private IWxLunbotuService wxLunbotuService;

    @Autowired
    private ISysNoticeService sysNoticeService;

    @Autowired
    private IWxActivityService wxActivityService;

    /**
     * 轮播图
     * @return
     */
    @GetMapping("/carousel")
    public AjaxResult listCarousel()
    {
        WxLunbotu wxLunbotu = new WxLunbotu();
        wxLunbotu.setState(1L);
        List<WxLunbotu> list = wxLunbotuService.selectWxLunbotuList(wxLunbotu);
        return AjaxResult.success("查询成功", list);
    }
        /**
        通知
         */
    @GetMapping("/notice")
    public AjaxResult listNotice(SysNotice notice)
    {

        notice.setNoticeType("1");
        notice.setStatus("0");
        List<SysNotice> list = sysNoticeService.selectNoticeList(notice);
        return AjaxResult.success("查询成功", list);
    }
    /**
     * 活动信息
     */
    @GetMapping("/activity")
    public AjaxResult listActivity()
    {
        WxActivity wxActivity = new WxActivity();
        wxActivity.setStatus(1);
        List<WxActivity> list = wxActivityService.selectWxActivityList(wxActivity);
        return AjaxResult.success("查询成功", list);
    }
}
