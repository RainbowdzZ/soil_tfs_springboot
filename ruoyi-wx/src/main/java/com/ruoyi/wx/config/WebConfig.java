package com.ruoyi.wx.config;

import com.ruoyi.wx.interceptor.WxTokenInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{



    @Bean
    public WxTokenInterceptor wxTokenInterceptor() {
        return new WxTokenInterceptor();
    }

    @Override
    public void addInterceptors(org.springframework.web.servlet.config.annotation.InterceptorRegistry registry) {
        registry.addInterceptor(wxTokenInterceptor())
                .addPathPatterns("/wx/**")
                .excludePathPatterns("/wx/wxLogin","/wx/wxuser/**","/wx/coupon/**","/wx/usercoupon/**","/wx/farm/**","/wx/lunbotu/**","/wx/home/**","/wx/feedback/**","/wx/sendOrderMessage","/wx/sendCheckupMessage","/wx/activity/**");
    }

}
