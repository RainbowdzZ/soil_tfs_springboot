package com.ruoyi.wx.enums;

public enum IsDeleteConstant {
    NO(0,"未删除"),
    YES(1,"已删除");
    private Integer code;
    private String msg;

    IsDeleteConstant(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode(){
        return code;
    }

    public String getMsg(){
        return msg;
    }
}
