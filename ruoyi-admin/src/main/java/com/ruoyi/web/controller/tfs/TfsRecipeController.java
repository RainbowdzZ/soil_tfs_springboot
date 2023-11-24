package com.ruoyi.web.controller.tfs;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.TfsRecipe;
import com.ruoyi.wx.domain.vo.ExpertLookVO;
import com.ruoyi.wx.service.ITfsRecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 专家配方Controller
 * 
 * @author riki
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/tfs/recipe")
public class TfsRecipeController extends BaseController
{
    @Autowired
    private ITfsRecipeService tfsRecipeService;

    /**
     * 查询待配方订单列表
     */
    @PreAuthorize("@ss.hasPermi('tfs:recipe:list')")
    @GetMapping("/list")
    public TableDataInfo list(TfsOrder tfsOrder)
    {
        startPage();
        List<TfsOrder> list = tfsRecipeService.selectTfsRecipeOrderList(tfsOrder);
        return getDataTable(list);
    }

    /**
     * 导出专家配方列表
     */
//    @PreAuthorize("@ss.hasPermi('tfs:recipe:export')")
//    @Log(title = "专家配方", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, TfsRecipe tfsRecipe)
//    {
//        List<TfsRecipe> list = tfsRecipeService.selectTfsRecipeList(tfsRecipe);
//        ExcelUtil<TfsRecipe> util = new ExcelUtil<TfsRecipe>(TfsRecipe.class);
//        util.exportExcel(response, list, "专家配方数据");
//    }

    /**
     * 通过订单号获取专家配方详细信息
     */
    @PreAuthorize("@ss.hasPermi('tfs:recipe:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tfsRecipeService.selectTfsRecipeByOrderId(id));
    }

    /**
     * 新增专家配方
     */
    @PreAuthorize("@ss.hasPermi('tfs:recipe:add')")
    @Log(title = "专家配方", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody @Validated TfsRecipe tfsRecipe)
    {
        return toAjax(tfsRecipeService.insertTfsRecipe(tfsRecipe));
    }

    /**
     * 修改专家配方
     */
    @PreAuthorize("@ss.hasPermi('tfs:recipe:edit')")
    @Log(title = "专家配方", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TfsRecipe tfsRecipe)
    {
        return toAjax(tfsRecipeService.updateTfsRecipe(tfsRecipe));
    }

    /**
     * 删除专家配方
     */
    @PreAuthorize("@ss.hasPermi('tfs:recipe:remove')")
    @Log(title = "专家配方", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tfsRecipeService.deleteTfsRecipeByIds(ids));
    }


    /**
     * 查看订单详情
     */
    @PreAuthorize("@ss.hasPermi('tfs:recipe:order')")
    @GetMapping("/order/{id}")
    public AjaxResult orderList(@PathVariable("id") Long id)
    {
        ExpertLookVO vo= tfsRecipeService.selectExpertLook(id);
        return success(vo);
    }
}
