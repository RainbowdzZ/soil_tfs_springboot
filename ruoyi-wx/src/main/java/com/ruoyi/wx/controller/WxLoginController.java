package com.ruoyi.wx.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.config.WxAppConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.domain.entity.WxUser;
import com.ruoyi.wx.domain.dto.WxLoginBody;
import com.ruoyi.wx.domain.vo.WxLoginUser;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.wx.mapper.WxUserMapper;
import com.ruoyi.wx.web.service.WxLoginService;
import com.ruoyi.wx.web.service.WxTokenService;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Arrays;

@RestController
@RequestMapping("/wx")
public class WxLoginController {


    private static final Logger logger= LoggerFactory.getLogger(WxLoginController.class);


    @Autowired
    private WxAppConfig wxAppConfig;

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private WxLoginService wxLoginService;

    @Autowired
    private WxTokenService wxTokenService;

    @Autowired
    private WxUserMapper wxUserMapper;

    @PostMapping("/wxLogin")
    public AjaxResult wxLogin(@Validated @RequestBody WxLoginBody wxLoginBody){

        logger.info("微信登录参数:{}"+ JSON.toJSONString(wxLoginBody));

       //        获取登录凭证，只能使用一次
        String code = wxLoginBody.getCode();

        //密钥
        String encryptedIv = wxLoginBody.getEncryptedIv();

        //加密数据
        String encryptedData = wxLoginBody.getEncryptedData();


        //想微信服务器发送请求获取用户信息
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + wxAppConfig.getAppId() + "&secret=" + wxAppConfig.getAppSecret() + "&js_code=" + code + "&grant_type=authorizatinon_code";
        String res = restTemplate.getForObject(url, String.class);
        JSONObject jsonObject = JSONObject.parseObject(res);

        //获取session_key和openid
        String sessionKey = jsonObject.getString("session_key");
        System.out.println(sessionKey);
        String openid = jsonObject.getString("openid");
        System.out.println(openid);


        //解密
        String decryptResult = "";
        try {
            //如果没有绑定微信开放平台，解析结果是没有unionid的。
            decryptResult = decrypt(sessionKey,encryptedIv,encryptedData);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("微信登录失败！");
        }

        if (StringUtils.hasText(decryptResult)){
            //如果解析成功,获取token
            String token = wxLoginService.wxLogin(decryptResult,openid);
            AjaxResult ajax = AjaxResult.success();
            ajax.put(Constants.WxTOKEN, token);
            return ajax;
        }else{
            return AjaxResult.error("微信登录失败！");
        }

    }


    /**
     //     * AES解密
     //     */
    private String decrypt(String sessionKey,String encryptedIv,String encryptedData) throws Exception{
        // 转化为字节数组
        byte[] key = Base64.decode(sessionKey);
        byte[] iv = Base64.decode(encryptedIv);
        byte[] encData = Base64.decode(encryptedData);
        // 如果密钥不足16位，那么就补足
        int base =16;
        if (key.length % base !=0) {
            int groups = key.length / base +(key.length % base != 0 ? 1 : 0);
            byte[] temp = new byte[groups * base];
            Arrays.fill(temp,(byte) 0);
            System.arraycopy(key,0,temp,0,key.length);
            key = temp;
        }
        // 如果初始向量不足16位，也补足
        if (iv.length % base !=0) {
            int groups = iv.length / base +(iv.length % base != 0 ? 1 : 0);
            byte[] temp = new byte[groups * base];
            Arrays.fill(temp,(byte) 0);
            System.arraycopy(iv,0,temp,0,iv.length);
            iv = temp;
        }

        AlgorithmParameterSpec ivSpec = new IvParameterSpec(iv);
        String resultStr = null;

        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            SecretKeySpec keySpec = new SecretKeySpec(key,"AES");
            cipher.init(Cipher.DECRYPT_MODE,keySpec,ivSpec);
            resultStr = new String(cipher.doFinal(encData),"UTF-8");
        } catch (Exception e){
            //            logger.info("解析错误");
            e.printStackTrace();
        }

        // 解析加密后的字符串
        return resultStr;
    }


    @GetMapping("/logout")
    public AjaxResult logout(HttpServletRequest request) {
        WxLoginUser wxLoginUser = wxTokenService.getWxLoginUser(request);
        if (wxLoginUser != null) {
            String token = wxLoginUser.getToken();
            String userName = wxLoginUser.getWxOpenId();
            // 删除用户缓存记录
            wxTokenService.deWxlLoginUser(token);
            // 记录用户退出日志
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(userName, Constants.LOGOUT, "退出成功"));

            return AjaxResult.success("退出成功");
        }else{
            return AjaxResult.error("退出失败");
        }

    }


    @GetMapping("/getWxInfo")
    public AjaxResult getWxInfo(HttpServletRequest request)
    {

        String token = wxTokenService.getWxToken(request);
        String openid = wxTokenService.getOpenidFromWxToken(token);
        WxUser wxUser = wxUserMapper.selectWxUserByOpenId(openid);

        AjaxResult ajax = AjaxResult.success();
        ajax.put("wxUser", wxUser);
        return ajax;
    }
}
