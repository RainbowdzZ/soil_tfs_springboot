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
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.service.IWxUserCouponService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 优惠券历史Controller
 * 
 * @author xqb
 * @date 2023-11-06
 */
@RestController
@RequestMapping("/wx/usercoupon")
public class WxUserCouponController extends BaseController
{
    @Autowired
    private IWxUserCouponService wxUserCouponService;

    /**
     * 查询优惠券历史列表
     */
    @PreAuthorize("@ss.hasPermi('wx:usercoupon:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxUserCoupon wxUserCoupon)
    {

        wxUserCouponService.couponsExpired();
        startPage();
        wxUserCoupon.setIsDelete(IsDeleteConstant.NO.getCode());
        List<WxUserCoupon> list = wxUserCouponService.selectWxUserCouponList(wxUserCoupon);
        return getDataTable(list);
    }

    /**
     * 导出优惠券历史列表
     */
    @PreAuthorize("@ss.hasPermi('wx:usercoupon:export')")
    @Log(title = "优惠券历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxUserCoupon wxUserCoupon)
    {
        List<WxUserCoupon> list = wxUserCouponService.selectWxUserCouponList(wxUserCoupon);
        ExcelUtil<WxUserCoupon> util = new ExcelUtil<WxUserCoupon>(WxUserCoupon.class);
        util.exportExcel(response, list, "优惠券历史数据");
    }

    /**
     * 获取优惠券历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('wx:usercoupon:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wxUserCouponService.selectWxUserCouponById(id));
    }

    /**
     * 新增优惠券历史
     */
    @PreAuthorize("@ss.hasPermi('wx:usercoupon:add')")
    @Log(title = "优惠券历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody @Validated WxUserCoupon wxUserCoupon)
    {
        return toAjax(wxUserCouponService.insertWxUserCoupon(wxUserCoupon));
    }

    /**
     * 修改优惠券历史
     */
    @PreAuthorize("@ss.hasPermi('wx:usercoupon:edit')")
    @Log(title = "优惠券历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxUserCoupon wxUserCoupon)
    {
        return toAjax(wxUserCouponService.updateWxUserCoupon(wxUserCoupon));
    }

    /**
     * 删除优惠券历史
     */
    @PreAuthorize("@ss.hasPermi('wx:usercoupon:remove')")
    @Log(title = "优惠券历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxUserCouponService.deleteWxUserCouponByIds(ids));
    }
}
