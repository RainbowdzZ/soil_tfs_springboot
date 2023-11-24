package com.ruoyi.wx.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.domain.vo.CouponVO;
import com.ruoyi.wx.domain.vo.IssuingCouponsVO;
import com.ruoyi.wx.service.IWxUserCouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/wx")
public class WxCouponUserController extends BaseController {


    @Autowired
    private IWxUserCouponService wxUserCouponService;
    /**
     * 查询可以发放的优惠券列表
     */
    @GetMapping("/userCoupons/list")
    public TableDataInfo IssuesCouponsList(){
        List<IssuingCouponsVO> coupons = wxUserCouponService.queryIssuingCoupons();
        return getDataTable(coupons);
    }

    /**
     * 领取优惠券
     */
    @PostMapping("/userCoupons/{id}/receive")
    public AjaxResult receiveCoupon(@PathVariable("id") Long couponId){


        try {
            wxUserCouponService.receiveCoupon(couponId);
            return AjaxResult.success();
        }catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

    }

    /**
     * 查看个人优惠劵
     */
    @GetMapping("/userCoupons/page")
    public AjaxResult userCouponsPage(WxUserCoupon wxUserCoupon){

        try {
            List<CouponVO> coupons = wxUserCouponService.queryUserCoupons(wxUserCoupon);

            return AjaxResult.success(coupons);
        }catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }


    }


    /**
     * 使用优惠券
     */
    @PostMapping("/userCoupons/{id}/use/{orderId}")
    public AjaxResult useCoupon(@PathVariable("id") Long id,@PathVariable("orderId") Long orderId){

        try {
            wxUserCouponService.useCoupon(id,orderId);
            return AjaxResult.success();
        }catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

    }

    /**
     * 查看可以使用的优惠劵列表
     */
    @GetMapping("/userCoupons/available/{userId}")
    public TableDataInfo availableCoupons(@PathVariable("userId") Long userId){
        startPage();
        List<CouponVO> coupons = wxUserCouponService.queryAvailableCoupons(userId);
        return getDataTable(coupons);
    }

    /**
     * 退还优惠券
     */
    @PostMapping("/userCoupons/{id}/return")
    public AjaxResult returnCoupon(@PathVariable("id") Long id){
        try {
            wxUserCouponService.returnCoupon(id);
            return AjaxResult.success();
        }catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }
}
