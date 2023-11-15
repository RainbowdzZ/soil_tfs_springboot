package com.ruoyi.wx.enums;

public enum OrderStatus {
    //订单状态 0:未支付 1:待送检 2:待检测 3:待配方 4:已完成 5:已取消 6:待采土
    UNPAID("0","未支付"),
    TO_BE_INSPECTED("1","待送检"),
    TO_BE_TESTED("2","待检测"),
    TO_BE_FORMULATED("3","待配方"),
    COMPLETED("4","已完成"),
    CANCELLED("5","已取消"),
    TO_BE_COLLECTED("6","待采土");



    private String code;

    private String msg;

    OrderStatus(String code,String msg){
        this.code = code;
        this.msg = msg;
    }

    public String getCode(){
        return code;
    }

    public String getMsg(){
        return msg;
    }


}
