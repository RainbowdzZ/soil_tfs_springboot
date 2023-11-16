package com.ruoyi.common.exception.order;

import com.ruoyi.common.exception.base.BaseException;

public class OrderException extends BaseException
{
    private static final long serialVersionUID = 1L;


    public OrderException(String code, Object[] args)
    {
        super("order", code, args, null);
    }

}
