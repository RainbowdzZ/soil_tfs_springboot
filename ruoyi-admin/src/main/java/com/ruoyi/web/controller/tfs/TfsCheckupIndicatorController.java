package com.ruoyi.web.controller.tfs;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wx.domain.entity.TfsCheckupIndicator;
import com.ruoyi.wx.service.ITfsCheckupIndicatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 检测指标管理Controller
 * 
 * @author riki
 * @date 2023-11-09
 */
@RestController
@RequestMapping("/tfs/indicator")
public class TfsCheckupIndicatorController extends BaseController
{
    @Autowired
    private ITfsCheckupIndicatorService tfsCheckupIndicatorService;

    /**
     * 查询检测指标管理列表
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:list')")
    @GetMapping("/list")
    public TableDataInfo list(TfsCheckupIndicator tfsCheckupIndicator)
    {
        startPage();
        List<TfsCheckupIndicator> list = tfsCheckupIndicatorService.selectTfsCheckupIndicatorList(tfsCheckupIndicator);
        return getDataTable(list);
    }

    /**
     * 查询检测指标管理列表
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:list')")
    @GetMapping("/list/status")
    public TableDataInfo list1(TfsCheckupIndicator tfsCheckupIndicator)
    {
        tfsCheckupIndicator.setStatus("1"); // 设置状态为1
        startPage();
        List<TfsCheckupIndicator> list = tfsCheckupIndicatorService.selectTfsCheckupIndicatorList(tfsCheckupIndicator);
        return getDataTable(list);
    }

    /**
     * 导出检测指标管理列表
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:export')")
    @Log(title = "检测指标管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TfsCheckupIndicator tfsCheckupIndicator)
    {
        List<TfsCheckupIndicator> list = tfsCheckupIndicatorService.selectTfsCheckupIndicatorList(tfsCheckupIndicator);
        ExcelUtil<TfsCheckupIndicator> util = new ExcelUtil<TfsCheckupIndicator>(TfsCheckupIndicator.class);
        util.exportExcel(response, list, "检测指标管理数据");
    }

    /**
     * 获取检测指标管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tfsCheckupIndicatorService.selectTfsCheckupIndicatorById(id));
    }

    /**
     * 新增检测指标管理
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:add')")
    @Log(title = "检测指标管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TfsCheckupIndicator tfsCheckupIndicator)
    {
        return toAjax(tfsCheckupIndicatorService.insertTfsCheckupIndicator(tfsCheckupIndicator));
    }

    /**
     * 修改检测指标管理
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:edit')")
    @Log(title = "检测指标管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TfsCheckupIndicator tfsCheckupIndicator)
    {
        return toAjax(tfsCheckupIndicatorService.updateTfsCheckupIndicator(tfsCheckupIndicator));
    }

    /**
     * 删除检测指标管理
     */
    @PreAuthorize("@ss.hasPermi('tfs:indicator:remove')")
    @Log(title = "检测指标管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tfsCheckupIndicatorService.deleteTfsCheckupIndicatorByIds(ids));
    }
}
