package ezen.team.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.UserDTO;
import ezen.team.mapper.MyPageMapper;

//마이페이지 담당 서비스

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	//세션에 담긴 회원 정보를 통해서 유저 정보 가져오기
	@Override
	public UserDTO getUserInfo(HttpSession session) {
		
		UserDTO uDto = (UserDTO) session.getAttribute("userDTO");
		
		String username = uDto.getUser_nm();
		
		UserDTO uDto2 = mapper.getUserInfo(username);
		
		return uDto2;
	}

	//회원 정보 수정 처리 완료하기
	@Override
	public void updateUser(UserDTO uDto) {
		
		
		mapper.userInfoUpdate(uDto);
		
	}

}
