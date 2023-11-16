package com.ruoyi.web.controller.wx;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.ruoyi.wx.domain.dto.CouponIssueFormDTO;
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
import com.ruoyi.wx.domain.entity.WxCoupon;
import com.ruoyi.wx.service.IWxCouponService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 优惠券Controller
 * 
 * @author xqb
 * @date 2023-11-05
 */
@RestController
@RequestMapping("/wx/coupon")
public class WxCouponController extends BaseController
{
    @Autowired
    private IWxCouponService wxCouponService;

    /**
     * 查询优惠券列表
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxCoupon wxCoupon)
    {
        startPage();
        wxCoupon.setIsDelete(IsDeleteConstant.NO.getCode());
        List<WxCoupon> list = wxCouponService.selectWxCouponList(wxCoupon);
        return getDataTable(list);
    }

    /**
     * 导出优惠券列表
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:export')")
    @Log(title = "优惠券", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxCoupon wxCoupon)
    {
        List<WxCoupon> list = wxCouponService.selectWxCouponList(wxCoupon);
        ExcelUtil<WxCoupon> util = new ExcelUtil<WxCoupon>(WxCoupon.class);
        util.exportExcel(response, list, "优惠券数据");
    }

    /**
     * 获取优惠券详细信息
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wxCouponService.selectWxCouponById(id));
    }

    /**
     * 新增优惠券
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:add')")
    @Log(title = "优惠券", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody @Validated WxCoupon wxCoupon)
    {
        return toAjax(wxCouponService.insertWxCoupon(wxCoupon));
    }

    /**
     * 修改优惠券
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:edit')")
    @Log(title = "优惠券", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxCoupon wxCoupon)
    {
        return toAjax(wxCouponService.updateWxCoupon(wxCoupon));
    }

    /**
     * 删除优惠券
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:remove')")
    @Log(title = "优惠券", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxCouponService.deleteWxCouponByIds(ids));
    }


    /**
     * 发放优惠劵
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:issue')")
    @Log(title = "优惠券", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/issue")
    public AjaxResult beginIssue(@PathVariable("id") Long id) {

        wxCouponService.beginIssue(id);

        return AjaxResult.success();
    }

    /**
     * 暂停发放优惠劵
     */
    @PreAuthorize("@ss.hasPermi('wx:coupon:stop')")
    @Log(title = "优惠券", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/stop")
    public void stopIssue(@PathVariable Long id) {
        wxCouponService.stopIssue(id);
    }


}
