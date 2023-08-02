package ezen.team.service;

import javax.servlet.http.HttpServletRequest;

import ezen.team.domain.UserDTO;

public interface UserService {

	// 회원가입 처리
	void userRegister(UserDTO userDTO);
	
	// 회원가입 시 아이디 중복체크
	UserDTO userIdChk(String user_id);
	// 회원 가입 시 이메일 인증
	String userEmailChk(String user_email);

	//로그인 처리
	boolean userLogin(HttpServletRequest rq);


}
