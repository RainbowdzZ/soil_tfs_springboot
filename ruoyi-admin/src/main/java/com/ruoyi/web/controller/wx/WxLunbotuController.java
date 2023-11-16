package com.ruoyi.web.controller.wx;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wx.domain.entity.WxLunbotu;
import com.ruoyi.wx.service.IWxLunbotuService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 小程序轮播图Controller
 * 
 * @author wqb
 * @date 2023-11-15
 */
@RestController
@RequestMapping("/wx/lunbotu")
public class WxLunbotuController extends BaseController
{
    @Autowired
    private IWxLunbotuService wxLunbotuService;

    /**
     * 查询小程序轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxLunbotu wxLunbotu)
    {
        startPage();
        List<WxLunbotu> list = wxLunbotuService.selectWxLunbotuList(wxLunbotu);
        return getDataTable(list);
    }

    /**
     * 导出小程序轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:export')")
    @Log(title = "小程序轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxLunbotu wxLunbotu)
    {
        List<WxLunbotu> list = wxLunbotuService.selectWxLunbotuList(wxLunbotu);
        ExcelUtil<WxLunbotu> util = new ExcelUtil<WxLunbotu>(WxLunbotu.class);
        util.exportExcel(response, list, "小程序轮播图数据");
    }

    /**
     * 获取小程序轮播图详细信息
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wxLunbotuService.selectWxLunbotuById(id));
    }

    /**
     * 新增小程序轮播图
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:add')")
    @Log(title = "小程序轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxLunbotu wxLunbotu)
    {
        return toAjax(wxLunbotuService.insertWxLunbotu(wxLunbotu));
    }

    /**
     * 修改小程序轮播图
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:edit')")
    @Log(title = "小程序轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxLunbotu wxLunbotu)
    {
        return toAjax(wxLunbotuService.updateWxLunbotu(wxLunbotu));
    }

    /**
     * 删除小程序轮播图
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:remove')")
    @Log(title = "小程序轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxLunbotuService.deleteWxLunbotuByIds(ids));
    }

    /**
     * 发布小程序轮播图
     */
    @PreAuthorize("@ss.hasPermi('wx:lunbotu:publish')")
    @Log(title = "小程序轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/publish/{id}")
    public AjaxResult publish(@PathVariable("id") Long id)
    {
        return toAjax(wxLunbotuService.publishWxLunbotuById(id));
    }
}
