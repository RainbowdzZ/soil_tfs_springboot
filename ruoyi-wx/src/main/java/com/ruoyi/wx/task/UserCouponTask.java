package com.ruoyi.wx.task;

import com.ruoyi.wx.domain.entity.WxUserCoupon;
import com.ruoyi.wx.enums.CouponStatusContant;
import com.ruoyi.wx.service.IWxUserCouponService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("userCouponTask")
public class UserCouponTask {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserCouponTask.class);

    @Autowired
    private IWxUserCouponService wxUserCouponService;

    public void delExpireCoupons() {


        LOGGER.info("过期或已使用优惠券定时删除开始");
        wxUserCouponService.lambdaUpdate()
                .eq(WxUserCoupon::getStatus, CouponStatusContant.UserCouponStatus.EXPIRED.getCode())
                .or()
                .eq(WxUserCoupon::getStatus, CouponStatusContant.UserCouponStatus.USED.getCode())
                .remove();

        LOGGER.info("过期或已使用优惠券定时删除结束");

    }

}
