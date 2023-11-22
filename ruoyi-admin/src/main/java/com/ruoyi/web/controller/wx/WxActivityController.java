package com.ruoyi.web.controller.wx;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wx.domain.entity.WxActivity;
import com.ruoyi.wx.service.IWxActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 活动管理Controller
 *
 * @author ruoyi
 * @date 2023-11-21
 */
@RestController
@RequestMapping("/wx/activity")
public class WxActivityController extends BaseController
{
    @Autowired
    private IWxActivityService wxActivityService;



    /**
     * 查询活动管理列表
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxActivity wxActivity)
    {
        startPage();
        List<WxActivity> list = wxActivityService.selectWxActivityList(wxActivity);
        return getDataTable(list);
    }

    /**
     * 导出活动管理列表
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:export')")
    @Log(title = "活动管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxActivity wxActivity)
    {
        List<WxActivity> list = wxActivityService.selectWxActivityList(wxActivity);
        ExcelUtil<WxActivity> util = new ExcelUtil<WxActivity>(WxActivity.class);
        util.exportExcel(response, list, "活动管理数据");
    }

    /**
     * 获取活动管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wxActivityService.selectWxActivityById(id));
    }

    /**
     * 新增活动管理
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:add')")
    @Log(title = "活动管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxActivity wxActivity)
    {
        return toAjax(wxActivityService.insertWxActivity(wxActivity));
    }

    /**
     * 修改活动管理
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:edit')")
    @Log(title = "活动管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxActivity wxActivity)
    {
        return toAjax(wxActivityService.updateWxActivity(wxActivity));
    }

    /**
     * 删除活动管理
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:remove')")
    @Log(title = "活动管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxActivityService.deleteWxActivityByIds(ids));
    }
    /**
     * 发布活动
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:publish')")
    @Log(title = "活动管理", businessType = BusinessType.UPDATE)
    @PostMapping("/publish/{id}")
    public AjaxResult publish(@PathVariable("id") Long id)
    {
        return toAjax(wxActivityService.publishWxActivityById(id));
    }
    /**
     * 停止发布活动
     */
    @PreAuthorize("@ss.hasPermi('wx:activity:publish')")
    @Log(title = "活动管理", businessType = BusinessType.UPDATE)
    @PostMapping("/stopPublish/{id}")
    public AjaxResult stopPublish(@PathVariable("id") Long id)
    {
        return toAjax(wxActivityService.stopPublishWxActivityById(id));
    }
}

