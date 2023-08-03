package ezen.team.mapper;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.UserDTO;

//마이페이지 담당 mapper

@Mapper
public interface MyPageMapper {

	//로그인한 회원의 아이디 값을 통해 유저 정보 가져오기
	UserDTO getUserInfo(String username);

	//회원정보 수정하기
	void userInfoUpdate(UserDTO uDto);

}
