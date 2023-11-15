package com.ruoyi.wx.web.service;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.wx.domain.vo.WxLoginUser;
import com.ruoyi.common.utils.DateUtils;

import com.ruoyi.wx.domain.entity.WxUser;
import com.ruoyi.wx.mapper.WxUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import java.util.Random;

@Component
public class WxLoginService {



    @Autowired
    private WxUserMapper userMapper;


    @Autowired
    private WxTokenService wxtokenService;

        /**
     * 微信登录
     *
     * @param decryptResult 登录凭证 只能用一次
     * @return
     */

   @Transactional(rollbackFor = Exception.class)
    public String wxLogin(String decryptResult,String openId){
        //字符串转json
        JSONObject jsonObject = JSONObject.parseObject(decryptResult);
        //        String unionid = jsonObject.getString("unionid");
        System.out.println(jsonObject);
        System.out.println("openId"+openId);
        //获取nickName
        String nickName = getStringRandom(16);// 生成16位随机昵称
        //获取头像
        String avatarUrl = jsonObject.getString("avatarUrl");
//        String avatarUrl = "";
        //还可以获取其他信息
        //根据openid判断数据库中是否有该用户
        //根据openid查询用户信息
        WxUser wxUser = userMapper.selectWxUserByOpenId(openId);

        //如果查不到，则新增，查到了，则更新
        WxUser user = new WxUser();
        if (wxUser == null) {
            // 新增

            user.setNickname(nickName);

            user.setAvatar(avatarUrl);
            //            wxUser.setUnionId(unionid);
            user.setOpenid(openId);
            user.setCreateTime(DateUtils.getNowDate());
            //新增 用户
            userMapper.insertWxUser(user);
        }else {
            //更新
            user = wxUser;
            user.setUpdateTime(DateUtils.getNowDate());
            userMapper.updateWxUser(user);
        }

        //组装token信息
        WxLoginUser wxLoginUser = new WxLoginUser();
        wxLoginUser.setWxOpenId(openId);
        //如果有的话设置
        wxLoginUser.setWxUser(user);


        // 生成token
        return wxtokenService.createWxToken(wxLoginUser);
    }

    //生成随机用户名，数字和字母组成,
    public String getStringRandom(int length) {

        String val = "";
        Random random = new Random();

        //参数length，表示生成几位随机数
        for (int i = 0; i < length; i++) {

            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            //输出字母还是数字
            if ("char".equalsIgnoreCase(charOrNum)) {
                //输出是大写字母还是小写字母
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char) (random.nextInt(26) + temp);
            } else if ("num".equalsIgnoreCase(charOrNum)) {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }
}
