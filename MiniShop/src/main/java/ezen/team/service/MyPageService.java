package ezen.team.service;

import javax.servlet.http.HttpSession;

import ezen.team.domain.UserDTO;

public interface MyPageService {

	//세션에 담긴 회원 정보를 통해서 유저 정보 가져오기
	UserDTO getUserInfo(HttpSession session);

	//회원 정보 처리 완료하기
	void updateUser(UserDTO uDto);

}
