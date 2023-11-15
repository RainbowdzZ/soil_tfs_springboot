package com.ruoyi.wx.domain.vo;

import com.ruoyi.wx.domain.entity.WxUser;

public class WxLoginUser {

    // 来自 WxUser 的额外字段
    private String wxOpenId; // WxUser 的 openid
    private String wxNickname; // WxUser 的昵称
    private String wxPhone; // WxUser 的手机号
    private Long wxSex; // WxUser 的性别

    private String token;

    /**
     * 登录时间
     */
    private Long loginTime;

    /**
     * 过期时间
     */
    private Long expireTime;


    public WxUser getWxUser() {
        return wxUser;
    }

    public void setWxUser(WxUser wxUser) {
        this.wxUser = wxUser;
    }

    private String wxAvatar; // WxUser 的头像

    private WxUser wxUser; // WxUser 对象

    public WxLoginUser() {
        super();
    }

    public WxLoginUser(WxUser wxUser) {
        // 设置来自 WxUser 的字段
        this.wxOpenId = wxUser.getOpenid();
        this.wxNickname = wxUser.getNickname();
        this.wxPhone = wxUser.getPhone();
        this.wxSex = wxUser.getSex();
        this.wxAvatar = wxUser.getAvatar();
    }



    // 获取和设置 WxUser 字段的方法
    public String getWxOpenId() {
        return wxOpenId;
    }

    public void setWxOpenId(String wxOpenId) {
        this.wxOpenId = wxOpenId;
    }

    public String getWxNickname() {
        return wxNickname;
    }

    public void setWxNickname(String wxNickname) {
        this.wxNickname = wxNickname;
    }

    public String getWxPhone() {
        return wxPhone;
    }

    public void setWxPhone(String wxPhone) {
        this.wxPhone = wxPhone;
    }

    public Long getWxSex() {
        return wxSex;
    }

    public void setWxSex(Long wxSex) {
        this.wxSex = wxSex;
    }

    public String getWxAvatar() {
        return wxAvatar;
    }

    public void setWxAvatar(String wxAvatar) {
        this.wxAvatar = wxAvatar;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Long loginTime) {
        this.loginTime = loginTime;
    }

    public Long getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Long expireTime) {
        this.expireTime = expireTime;
    }
}
