package com.ruoyi.wx.websocket;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.wx.web.service.WxTokenService;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;


//这个是客户端访问的接口
@ServerEndpoint("/imserver/app/{userId}")
@Component
@Service
public class WebSocketServerApp {

    //日志
    static Logger log = LoggerFactory.getLogger(WebSocketServerApp.class);
    /**
     * 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
     */
    private static int onlineCount = 0;

    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
     */
    //新建一个ConcurrentHashMap webSocketMap 用于接收当前userId的WebSocket，方便IM之间对userId进行推送消息。
    private static ConcurrentHashMap<String, WebSocketServerApp> webSocketMap = new ConcurrentHashMap<>();
    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;
    //    /**接收userId*/
    private String userId = "";

    public static Session temp;

    public static boolean flag = false;

    private WxTokenService wxTokenService;
    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userId) {
        //解析JWT


            //获取到session和userId
            this.session = session;
            this.userId = userId;
            this.temp = session;
            flag = true;
            //如果userId存在，则移除，再添加一个相同的userId和新的Session（防止session过期）
            if (webSocketMap.containsKey(userId)) {
                webSocketMap.remove(userId);
                webSocketMap.put(userId, this);
            } else {
                webSocketMap.put(userId, this);
                //在线数加1
                addOnlineCount();
            }
            log.info("用户连接:" + userId + ",当前在线人数为:" + getOnlineCount());
//            try {
//                sendMessage(this.userId + "连接成功");
//            } catch (IOException e) {
//                log.error("用户:" + userId + ",网络异常!!!!!!");
//            }

    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        //如果存在userId则移除，然后人数-1
        if (webSocketMap.containsKey(userId)) {
            webSocketMap.remove(userId);
            //从set中删除
            subOnlineCount();
            flag = false;
        }
        log.info("用户退出:" + userId + ",当前在线人数为:" + getOnlineCount());
    }

    /**
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("用户错误:" + this.userId + ",原因:" + error.getMessage());
        error.printStackTrace();
    }


    // 收到客户端消息后调用的方法
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info(message);
    }
    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    /**
     * 发送自定义消息
     */
    public static void sendInfo(String message, @PathParam("userId") String userId) throws IOException {
        log.info("发送消息到:" + userId + "，报文:" + message);

        if (StringUtils.isNotBlank(userId) && webSocketMap.containsKey(userId)) {
            webSocketMap.get(userId).sendMessage(message);
        } else {
            log.error("用户" + userId + ",不在线！");
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketServerApp.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketServerApp.onlineCount--;
    }

    public void setSession(Session session) {
        this.session = session;
    }
}

