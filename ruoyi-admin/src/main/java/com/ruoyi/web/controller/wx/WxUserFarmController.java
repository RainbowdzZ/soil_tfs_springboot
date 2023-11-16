package com.ruoyi.web.controller.wx;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.wx.enums.IsDeleteConstant;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
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
import com.ruoyi.wx.domain.entity.WxUserFarm;
import com.ruoyi.wx.service.IWxUserFarmService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 农场管理Controller
 * 
 * @author xqb
 * @date 2023-11-08
 */
@RestController
@RequestMapping("/wx/farm")
public class WxUserFarmController extends BaseController
{
    @Autowired
    private IWxUserFarmService wxUserFarmService;

    /**
     * 查询农场管理列表
     */
    @PreAuthorize("@ss.hasPermi('wx:farm:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxUserFarm wxUserFarm)
    {
        startPage();
        wxUserFarm.setIsDeleted(IsDeleteConstant.NO.getCode());
        List<WxUserFarm> list = wxUserFarmService.selectWxUserFarmList(wxUserFarm);
        return getDataTable(list);
    }

    /**
     * 导出农场管理列表
     */
    @PreAuthorize("@ss.hasPermi('wx:farm:export')")
    @Log(title = "农场管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxUserFarm wxUserFarm)
    {
        List<WxUserFarm> list = wxUserFarmService.selectWxUserFarmList(wxUserFarm);
        ExcelUtil<WxUserFarm> util = new ExcelUtil<WxUserFarm>(WxUserFarm.class);
        util.exportExcel(response, list, "农场管理数据");
    }

    /**
     * 获取农场管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('wx:farm:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wxUserFarmService.selectWxUserFarmById(id));
    }

    /**
     * 新增农场管理
     */
    @PreAuthorize("@ss.hasPermi('wx:farm:add')")
    @Log(title = "农场管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody @Validated WxUserFarm wxUserFarm)
    {
        return toAjax(wxUserFarmService.insertWxUserFarm(wxUserFarm));
    }

    /**
     * 修改农场管理
     */
    @PreAuthorize("@ss.hasPermi('wx:farm:edit')")
    @Log(title = "农场管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxUserFarm wxUserFarm)
    {
        return toAjax(wxUserFarmService.updateWxUserFarm(wxUserFarm));
    }

    /**
     * 删除农场管理
     */
    @PreAuthorize("@ss.hasPermi('wx:farm:remove')")
    @Log(title = "农场管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxUserFarmService.deleteWxUserFarmByIds(ids));
    }
}
