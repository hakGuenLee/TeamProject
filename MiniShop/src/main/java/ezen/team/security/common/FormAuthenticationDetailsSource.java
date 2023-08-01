//package ezen.team.security.common;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.security.authentication.AuthenticationDetailsSource;
//import org.springframework.security.web.authentication.WebAuthenticationDetails;
//import org.springframework.stereotype.Component;
//
//
////사용자가 아이디, 패스워드 외에 추가로 넘기는 정보를 저장하여 계속하여 참조할 수 있게 함
//
//@Component
//public class FormAuthenticationDetailsSource implements AuthenticationDetailsSource<HttpServletRequest, WebAuthenticationDetails> {
//
//	@Override
//	public WebAuthenticationDetails buildDetails(HttpServletRequest context) {
//		
//		System.out.println("context : " + context);
//		
//		return new FormWebAuthenticationDetails(context);
//	}
//
//	
//	
//	
//}
