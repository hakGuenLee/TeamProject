package ezen.team.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

//인증 실패 시 처리하는 Handler
@Component
public class CustomAuthenticationFailureHandler extends
	SimpleUrlAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

	//기본적으로 전달하는 예외 메세지를 작성	
	String errorMsg = "Check your Id or Password again!";
		
	//예외 종류에 따라 타입별 메세지 전달
	if(exception instanceof BadCredentialsException) {
		errorMsg = "Check your Id or Password again!";
		
		//시크릿 키가 일치하지 않을 경우
	}else if(exception instanceof InsufficientAuthenticationException) {
		errorMsg = "Secret Key Error!!";
	}
	
	//인증 실패시의 기본 경로
	setDefaultFailureUrl("/adminLogin?error=true&exception=" + errorMsg);
		
		super.onAuthenticationFailure(request, response, exception);
	}
	
}
