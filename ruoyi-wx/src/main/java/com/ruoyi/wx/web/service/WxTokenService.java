package com.ruoyi.wx.web.service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpServletRequest;


import com.ruoyi.wx.domain.vo.WxLoginUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.ruoyi.common.core.redis.RedisCache;

import com.ruoyi.common.utils.StringUtils;

import com.ruoyi.common.utils.uuid.IdUtils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Component;

@Component
public class WxTokenService {
    private static final Logger log = LoggerFactory.getLogger(WxTokenService.class);

    @Value("${token.header}")
    private String header;

    @Value("${token.secret}")
    private String secret;

    @Value("${token.expireTime}")
    private int expireTime;

    @Autowired
    private RedisCache redisCache;

    protected static final long MILLIS_SECOND = 1000;

    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    private static final Long MILLIS_MINUTE_TEN = 20 * 60 * 1000L;


    /**
     * 获取微信用户身份信息
     *
     * @return 微信用户信息
     */
    public WxLoginUser getWxLoginUser(HttpServletRequest request) {

        String token = getWxToken(request);
        if (StringUtils.isNotEmpty(token)) {
            try {
                Claims claims = parseToken(token);
                String openid = (String) claims.get("openid");
                String userKey = getWxUserKey(openid);
                WxLoginUser wxuser = redisCache.getCacheObject(userKey);

                return wxuser;
            } catch (Exception e)
            {
                log.error("获取微信用户信息异常'{}'", e.getMessage());
            }

        }
        return null;
    }

    public void deWxlLoginUser(String token)
    {
        if (StringUtils.isNotEmpty(token))
        {
            String userKey = getWxUserKey(token);
            redisCache.deleteObject(userKey);
        }
    }
    /**
     * 获取微信用户授权登录的token
     *
     * @param wxLoginUser 微信用户信息
     * @return 微信用户授权登录的token
     */
    public String createWxToken(WxLoginUser wxLoginUser) {
        String token = IdUtils.fastUUID();
        wxLoginUser.setToken(token);
        setUserAgent(wxLoginUser);
        refreshToken(wxLoginUser);

        Map<String, Object> claims = new HashMap<>();
        claims.put("openid", wxLoginUser.getWxOpenId());
        return createToken(claims);
    }

    /**
     * 验证微信用户授权登录的token有效期，相差不足20分钟，自动刷新缓存
     *
     * @param wxLoginUser 微信用户信息
     */
    public void verifyWxToken(WxLoginUser wxLoginUser) {
        long expireTime = wxLoginUser.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN) {
            refreshToken(wxLoginUser);
        }
    }

    /**
     * 刷新微信用户授权登录的token有效期
     *
     * @param wxLoginUser 微信用户信息
     */
    public void refreshToken(WxLoginUser wxLoginUser) {
        wxLoginUser.setLoginTime(System.currentTimeMillis());
        wxLoginUser.setExpireTime(wxLoginUser.getLoginTime() + expireTime * MILLIS_MINUTE);
        String openid = wxLoginUser.getWxOpenId();
        String wxUserKey = getWxUserKey(openid);
        redisCache.setCacheObject(wxUserKey, wxLoginUser, expireTime, TimeUnit.MINUTES);
    }

    /**
     * 创建令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims) {
        String token = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, secret).compact();
        return token;
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    public Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 从微信用户的token中获取微信用户的openid
     *
     * @param token 微信用户的token
     * @return 微信用户的openid
     */
    public String getOpenidFromWxToken(String token) {
        Claims claims = parseToken(token);
        return (String) claims.get("openid");
    }

    /**
     * 获取微信用户授权登录的token
     *
     * @param request HTTP请求
     * @return 微信用户的token
     */
    public String getWxToken(HttpServletRequest request) {
        String token = request.getHeader(header);
        if (StringUtils.isNotEmpty(token) && token.startsWith("Bearer ")) {
            token = token.replace("Bearer ", "");
        }
        return token;
    }

    public String getWxUserKey(String openid) {
        return "WX_USER:" + openid;
    }

    /**
     * 设置用户代理信息
     *
     * @param wxLoginUser 微信用户信息
     */
    public void setUserAgent(WxLoginUser wxLoginUser) {
        // 这里可以设置微信用户的用户代理信息，包括IP、登录地点、浏览器、操作系统等
        // 如果有相关的方法可以用来获取这些信息，可以在这里设置
    }
}
