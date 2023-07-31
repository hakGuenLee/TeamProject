//package ezen.team.security.common;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.security.web.authentication.WebAuthenticationDetails;
//
//public class FormWebAuthenticationDetails extends WebAuthenticationDetails {
//
//	private String secretKey;
//	
//	//추가로 넘어온 파라미터 secret_key 벨류 저장
//	
//	public FormWebAuthenticationDetails(HttpServletRequest request) {
//		super(request);
//		
//		secretKey = request.getParameter("secret_key");
//	
//		System.out.println("시크릿 키 : " + secretKey);
//	}
//	
//	//getter
//	public String getSecretKey() {
//		return secretKey;
//	}
//	
//	
//}
