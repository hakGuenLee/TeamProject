package ezen.team.mapper;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.UserDTO;

//UserServiceImpl과 연결

@Mapper
public interface UserMapper {

	// 회원ㄱㅏ입 처리
	void userRegister(UserDTO userDTO);
	
	//회원가입 시 아이디 중복체크
	UserDTO userIdChk(String user_id);

	UserDTO userLogin(HttpServletRequest rq);

	UserDTO userLogin(String user_id);

	String findId(UserDTO userDTO);

	UserDTO findPw(UserDTO userDTO);

	void pwChange(String user_id, String user_pw);
}
