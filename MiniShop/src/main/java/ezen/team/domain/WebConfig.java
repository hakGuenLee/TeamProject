package ezen.team.domain;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import ezen.team.interceptor.UserInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Autowired
	private UserInterceptor userInterceptor;
	
	//interceptor 등록 및 url 지정
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(userInterceptor)
		.addPathPatterns("/myPage/**")
		.addPathPatterns("/userQna/**")
		.addPathPatterns("/board/question")
		.addPathPatterns("/board/prodQuestion")
		.addPathPatterns("/cart/**");

	}
	

}
