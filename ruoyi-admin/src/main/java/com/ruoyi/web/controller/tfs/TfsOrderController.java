package com.ruoyi.web.controller.tfs;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.enums.IsDeleteConstant;
import com.ruoyi.wx.service.ITfsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 订单管理Controller
 * 
 * @author riki
 * @date 2023-11-02
 */
@RestController
@RequestMapping("/tfs/order")
public class TfsOrderController extends BaseController
{
    @Autowired
    private ITfsOrderService tfsOrderService;


    /**
     * 查询订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('tfs:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(TfsOrder tfsOrder)
    {
        startPage();
        tfsOrder.setIsDelete(IsDeleteConstant.NO.getCode());
        List<TfsOrder> list = tfsOrderService.selectTfsOrderList(tfsOrder);
        return getDataTable(list);
    }

    /**
     * 导出订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('tfs:order:export')")
    @Log(title = "订单管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TfsOrder tfsOrder)
    {
        List<TfsOrder> list = tfsOrderService.selectTfsOrderList(tfsOrder);
        ExcelUtil<TfsOrder> util = new ExcelUtil<TfsOrder>(TfsOrder.class);
        util.exportExcel(response, list, "订单管理数据");
    }

    /**
     * 获取订单管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('tfs:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tfsOrderService.selectTfsOrderById(id));
    }

    /**
     * 提交订单
     */
    @PreAuthorize("@ss.hasPermi('tfs:order:add')")
    @Log(title = "提交订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TfsOrder tfsOrder)
    {
        Long orderId = tfsOrderService.insertTfsOrder(tfsOrder);
        return AjaxResult.success(orderId);
    }

    /**
     * 修改订单管理
     */
    @PreAuthorize("@ss.hasPermi('tfs:order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TfsOrder tfsOrder)
    {
        return toAjax(tfsOrderService.updateTfsOrder(tfsOrder));
    }
    /**
     * 修改订单状态
     */
    // 修改订单状态
    @PreAuthorize("@ss.hasPermi('tfs:order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/updateStatus")
    public AjaxResult updateOrderStatus(@RequestParam Long orderId, @RequestParam Character status) {
        TfsOrder tfsOrder = tfsOrderService.selectTfsOrderById(orderId);
        if (tfsOrder == null) {
            return AjaxResult.error("订单不存在");
        }
        tfsOrder.setOrderStatus(String.valueOf(status));
        return toAjax(tfsOrderService.updateTfsOrder(tfsOrder));
    }


    /**
     * 删除订单管理
     */
    @PreAuthorize("@ss.hasPermi('tfs:order:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tfsOrderService.deleteTfsOrderByIds(ids));
    }
}
