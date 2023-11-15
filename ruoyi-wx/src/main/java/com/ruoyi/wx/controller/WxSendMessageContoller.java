package com.ruoyi.wx.controller;

import com.ruoyi.wx.websocket.WebSocketServerApp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wx")
public class WxSendMessageContoller {





    /**
     * 向管理端发送订单提示
     */
    @PostMapping("/sendOrderMessage")
    public void sendOrderMessage() throws Exception {
        WebSocketServerApp.sendInfo("您有新的订单，请及时处理","1");
    }
}
