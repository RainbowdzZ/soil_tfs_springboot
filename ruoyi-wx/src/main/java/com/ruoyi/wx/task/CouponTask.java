package com.ruoyi.wx.task;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.enums.CouponConstant;
import com.ruoyi.wx.service.IWxCouponService;
import com.ruoyi.wx.service.IWxUserCouponService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("couponTask")
public class CouponTask {


    private static final Logger LOGGER = LoggerFactory.getLogger(CouponTask.class);

    @Autowired
    private IWxUserCouponService wxUserCouponService;


    @Autowired
    private IWxCouponService wxCouponService;
    public void checkCouponExpire() {

        LOGGER.info("优惠券过期检查开始");
        wxCouponService.checkCouponExpired();
        LOGGER.info("优惠券过期检查结束");

    }


    public void delEndCoupons() {
        LOGGER.info("优惠券活动定时删除开始");
        wxUserCouponService.lambdaUpdate()
                .eq(WxUserCoupon::getStatus, CouponConstant.CouponStatus.ENDED.getCode())
                .remove();
        LOGGER.info("优惠券活动定时删除结束");

    }

}
