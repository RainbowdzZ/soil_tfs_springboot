package com.ruoyi.wx.enums;

public class CouponStatusContant {

    public enum UserCouponStatus{

        //未使用
        NOT_USED(1L, "未使用"),
        //已使用
        USED(2L, "已使用"),
        //已过期
        EXPIRED(3L, "已过期");
        private Long code;
        private String msg;

        UserCouponStatus(Long code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        public Long getCode() {
            return code;
        }

        public String getMsg() {
            return msg;
        }
    }
}
