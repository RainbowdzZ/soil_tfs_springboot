package com.ruoyi.wx.controller;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.wx.domain.entity.TfsCheckup;
import com.ruoyi.wx.domain.entity.TfsOrder;
import com.ruoyi.wx.domain.entity.TfsRecipe;
import com.ruoyi.wx.domain.vo.WxOrderVo;
import com.ruoyi.wx.enums.OrderStatus;
import com.ruoyi.wx.service.ITfsCheckupService;
import com.ruoyi.wx.service.ITfsOrderService;
import com.ruoyi.wx.service.ITfsRecipeService;
import com.ruoyi.wx.utils.LocationUtils;
import com.ruoyi.wx.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/wx/order")
public class WxOrderController extends BaseController {

    @Autowired
    private ITfsOrderService tfsOrderService;

    @Autowired
    private ITfsRecipeService tfsRecipeService;

    @Autowired
    private ITfsCheckupService tfsCheckupService;

    @Autowired
    private LocationUtils locationUtils;
    /**
     * 提交订单
     */
    @PostMapping("/create")
    public AjaxResult createOrder(@RequestBody TfsOrder tfsOrder)
    {

        Long orderId = tfsOrderService.insertTfsOrder(tfsOrder);
        return AjaxResult.success("订单提交成功",orderId);
    }

    /**
     * 查看当前用户订单
     *
     */
    @GetMapping("/list/{userId}")
    public TableDataInfo list(@PathVariable("userId") Long wxUserId)
    {
        startPage();
        List<WxOrderVo> orderVos=tfsOrderService.selectOrderByUserId(wxUserId);
        return getDataTable(orderVos);
    }


    /**
     * 处理订单支付
     */
    @PutMapping("/payOrder")
    public AjaxResult payOrder(@RequestBody TfsOrder tfsOrder) {
        try {
            tfsOrderService.processOrderPayment(tfsOrder);
            return AjaxResult.success("订单支付成功");
        } catch (Exception e) {
            return AjaxResult.error("订单支付失败：" + e.getMessage());
        }
    }


    /**
     * 取消订单
     */
    @PutMapping("/cancelOrder/{orderId}")
    public AjaxResult cancelOrder(@PathVariable("orderId") Long orderId) {
        try {
            tfsOrderService.cancelOrder(orderId);
            return AjaxResult.success("订单取消成功");
        } catch (Exception e) {
            return AjaxResult.error("订单取消失败：" + e.getMessage());
        }
    }

    /**
     * 查看配方单
     */
    @GetMapping("/recipeOrder/{orderId}")
    public AjaxResult recipeOrder(@PathVariable("orderId") Long orderId) {
        try {
            TfsRecipe recipe=tfsRecipeService.selectRecipeOrder(orderId);
            return AjaxResult.success("查看配方单成功",recipe);
        } catch (Exception e) {
            return AjaxResult.error("查看配方单失败：" + e.getMessage());
        }
    }

    /**
     * 查看检测单
     */
    @GetMapping("/checkupOrder/{orderId}")
    public AjaxResult checkUpOrder(@PathVariable("orderId") Long orderId){
        try {
            List<TfsCheckup> checkups=tfsCheckupService.selectCheckUpOrder(orderId);
            return AjaxResult.success("查看检测单成功",checkups);
        } catch (Exception e) {
            return AjaxResult.error("查看检测单失败：" + e.getMessage());
        }
    }

    /**
     * 上传采土图片与定位信息
     */
    @PostMapping("/uploadLocation")
    public AjaxResult uploadLocation(@RequestBody TfsOrder tfsOrder){
        try {
            tfsOrder.setOrderStatus(OrderStatus.TO_BE_INSPECTED.getCode());

            String location = tfsOrder.getLongitude()+","+tfsOrder.getLatitude();
            Map<String, String> params = new HashMap<>();
            params.put("location", location);
            //向高德地图发送请求获取详细地址
            JSONObject object = locationUtils.getCounterLocation(params);
            String address = object.getString("formatted_address");
            tfsOrder.setAddress(address);
            tfsOrderService.updateTfsOrder(tfsOrder);
            return AjaxResult.success("上传采土图片与定位信息成功");
        } catch (Exception e) {

            return AjaxResult.error("上传采土图片与定位信息失败：" + e.getMessage());
        }
    }

    /**
     * 提交快递信息
     */
    @PostMapping("/uploadCourier")
    public AjaxResult uploadCourier(@RequestBody TfsOrder tfsOrder){
        try {
            tfsOrderService.updateTfsOrder(tfsOrder);
            return AjaxResult.success("提交快递信息成功");
        } catch (Exception e) {

            return AjaxResult.error("提交快递信息失败：" + e.getMessage());
        }
    }

}
