package com.ruoyi.web.controller.tfs;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wx.domain.entity.TfsCheckup;
import com.ruoyi.wx.service.ITfsCheckupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 检测单表的controller
 */
@RestController
@RequestMapping("/tfs/checkup")
public class TfsCheckupController extends BaseController {

    @Autowired
    private ITfsCheckupService tfsCheckupService;
    /**
//     * 新增检测单
//     */
    @PreAuthorize("@ss.hasPermi('tfs:order:add')")
    @Log(title = "提交检测单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TfsCheckup tfsCheckup)
    {
        return toAjax(tfsCheckupService.insertTfsCheckup(tfsCheckup));
    }
}
