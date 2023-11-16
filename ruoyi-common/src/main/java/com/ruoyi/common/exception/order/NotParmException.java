package com.ruoyi.common.exception.order;

public class NotParmException extends OrderException{

    private static final long serialVersionUID = 1L;

    public NotParmException()
    {
        super("order.not.parm", null);
    }
}
