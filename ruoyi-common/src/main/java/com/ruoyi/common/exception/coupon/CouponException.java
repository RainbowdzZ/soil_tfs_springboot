package com.ruoyi.common.exception.coupon;

import com.ruoyi.common.exception.base.BaseException;

public class CouponException extends BaseException {

        private static final long serialVersionUID = 1L;

        public CouponException(String code, Object[] args)
    {
        super("coupon", code, args, null);
    }
}
