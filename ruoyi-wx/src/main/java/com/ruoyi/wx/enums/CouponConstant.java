package com.ruoyi.wx.enums;

public class CouponConstant {

    public enum CouponStatus {

        // 优惠券状态
        //1：待发放，2：未开始   3：进行中，4：已结束，5：暂停
        TO_ISSUE(1L, "待发放"),
        NOT_STARTED(2L, "未开始"),
        IN_PROGRESS(3L, "进行中"),
        ENDED(4L, "已结束"),
        PAUSED(5L, "暂停");

        private Long code;
        private String msg;

        CouponStatus(Long code, String msg) {
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


    public enum CouponType {
        ORDINARY(1L, "普通优惠券");
        // 可添加更多优惠券类型

        private Long code;
        private String msg;

        CouponType(Long code, String msg) {
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


    public enum DiscountType {

        FULL_REDUCTION(1L, "满减"),
        PER_FULL_REDUCTION(2L, "每满减"),
        DISCOUNT(3L, "折扣"),
        NO_THRESHOLD(4L, "无门槛");
        // 可添加更多折扣类型

        private Long code;
        private String msg;

        DiscountType(Long code, String msg) {
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

    public enum ObtainWay {

        // 优惠券领取方式
        //手动领取
        MANUAL(1L, "手动领取"),
        //兑换码
        EXCHANGE_CODE(2L, "兑换码");

        private Long code;
        private String msg;

        ObtainWay(Long code, String msg) {
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
