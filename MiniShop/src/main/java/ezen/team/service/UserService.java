package ezen.team.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.User;

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
	
	UserDTO getUserInfo(String accessToken);
	///// 카카오 로그인 /////
	
	//카카오 로그인을 위한 토큰 값 가져오기
	String getToken(String code);
	
	
	

	///// 카카오 로그인 /////

	//id찾기
	String findId(UserDTO userDTO);

	String findPw(UserDTO userDTO);

	void pwChange(String user_id, String user_pw);




}
