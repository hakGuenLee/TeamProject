package ezen.team.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

//인가 예외 처리 Handler

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	private String errorPage;
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		System.out.println("deniedrequest : " + request);
		
		//예외 발생한 페이지에 메세지 보내기
		
		String deniedUrl = errorPage + "?exception=" + accessDeniedException.getMessage();
		response.sendRedirect(deniedUrl);
	}
	
	//errorPage Setter
	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}

}
