package com.ruoyi.wx.interceptor;

import com.ruoyi.wx.domain.vo.WxLoginUser;
import com.ruoyi.common.exception.GlobalException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.wx.utils.UserContext;
import com.ruoyi.wx.web.service.WxTokenService;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WxTokenInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(WxTokenInterceptor.class);


    @Autowired
    private WxTokenService wxTokenService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //支持跨域请求
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with,token,X-URL-PATH,content-type");
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));


        // 在请求处理之前执行，用于验证Token
        // 1. 从请求头中获取Token
        String token = wxTokenService.getWxToken(request);


        try {
            // 2. 验证Token的有效性
            if (isValidToken(token)) {
                // Token有效，允许请求继续执行

                // 在这里检查Token是否即将过期，如果即将过期，触发自动续期
                WxLoginUser wxLoginUser = wxTokenService.getWxLoginUser(request);
                if (wxLoginUser != null) {
                    wxTokenService.verifyWxToken(wxLoginUser); // 自动续期

                    UserContext.setUser(wxLoginUser.getWxUser().getId());

                    return true;
                }else {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    throw new GlobalException("用户未登录无法访问");
//                    handleUnauthorizedException(response, "用户未登录无法访问");
//                    return false;
                }


            } else {
//                 Token无效，拒绝请求
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                throw new GlobalException("Token无效");
//                handleUnauthorizedException(response, "Token无效");
//                return false;
            }
        } catch (Exception e) {
            // 处理异常情况，记录日志
            log.error("Token验证出现异常: {}"+ e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            return false;
        }
    }

//    private void handleUnauthorizedException(HttpServletResponse response, String message) throws IOException {
//        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//        response.setContentType("application/json;charset=UTF-8");
//        String jsonResponse = String.format("{\"error\": \"%s\", \"message\": \"%s\"}", HttpServletResponse.SC_UNAUTHORIZED, message);
//        response.getWriter().write(jsonResponse);
////        response.getWriter().write("{\"error\": \"" + message + "\"}");
//    }
//
//    private void handleInternalServerError(HttpServletResponse response, String message) throws IOException {
//        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        response.setContentType("application/json;charset=UTF-8");
//        String jsonResponse = String.format("{\"error\": \"%s\", \"message\": \"%s\"}", HttpServletResponse.SC_INTERNAL_SERVER_ERROR, message);
//        response.getWriter().write(jsonResponse);
//    }

        @Override
        public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
            // 在请求处理之后，视图渲染之前执行
        }

        @Override
        public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
            // 在请求处理完成后执行
            UserContext.removeUser();
        }

        public boolean isValidToken(String token) {
            // 实现Token验证逻辑，可以使用WxTokenService中的方法
            // 例如：WxTokenService.verifyWxToken(token)
            // 如果Token有效，返回true；否则，返回false

            if (StringUtils.isEmpty(token) || token.length() == 0) {
                return false;
            }

            try {
                Claims claims=wxTokenService.parseToken(token);
            }catch (Exception e) {
                return false;
            }

            return true; // 根据您的实际逻辑进行修改
        }
}
