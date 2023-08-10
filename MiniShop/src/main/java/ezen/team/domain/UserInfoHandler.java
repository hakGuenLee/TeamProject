package ezen.team.domain;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;


//session에서 회원 아이디 가져오는 Handler
@Component
public class UserInfoHandler {

	//session에 담긴 user_id 얻는 메서드
	public String getUserId(HttpSession session) {
		
	 UserDTO user =	(UserDTO)session.getAttribute("userDTO");
		
		return user.getUser_id();
	}
	
	//session에 담긴 user의 name을 얻는 메서드
	public String getUserName(HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
	
		return user.getUser_nm();
	}
	
	
}
