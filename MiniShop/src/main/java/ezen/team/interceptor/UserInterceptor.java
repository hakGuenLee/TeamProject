package ezen.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


//사용자 로그인 인터셉터(임시로 만들어두었습니다)

@Component
public class UserInterceptor extends HandlerInterceptorAdapter {

	
	//특정 URL 접근 전 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Object UserDTO = session.getAttribute("userDTO");
		
		//인터셉터 발동 전 페이지 주소값을 session에 셋팅
		String path = (String)request.getHeader("REFERER");
		session.setAttribute("prev_url", path);
		System.out.println("이전페이지 : " + path);
		
		//로그인되지 않은 상태에서 접근 시 로그인 페이지 띄우기
		if(UserDTO == null) {
			response.sendRedirect("/user/userLogin");
			return false;
		}else {
			
	
			return true;
		}

	}
	

		
		
	
}
