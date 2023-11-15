package com.ruoyi.wx.web.service;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.wx.domain.entity.WxUser;
import com.ruoyi.wx.service.IWxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class WxDownloadAvatarService {

    @Autowired
    private RestTemplate restTemplate;  // 这里需要确保你的Spring配置了RestTemplate

    @Autowired
    private IWxUserService wxUserService;


    public String Download(String url,Long userId){
        try {
            byte[] avatarData  = restTemplate.getForObject(url, byte[].class);
            System.out.println(avatarData.length);
            String avatarFileName = userId + "_avatar.jpg";  // 或者其他合适的文件名
            String avatarFilePath = RuoYiConfig.getDownloadPath() + avatarFileName;
            FileUtils.writeBytes(avatarData,avatarFilePath);

            return avatarFilePath;


        }catch (Exception e){

            e.printStackTrace();

        }

        return null;
    }
}
