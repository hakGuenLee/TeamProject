package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.UserDTO;

public interface MyPageService {

	//세션에 담긴 회원 정보를 통해서 유저 정보 가져오기
	UserDTO getUserInfo(HttpSession session);

	//회원 정보 처리 완료하기
	void updateUser(UserDTO uDto);

	//회원 아이디에 맞는 배송지 리스트 가져오기
	List<AddrDTO> getAddressList(HttpSession session);

	//배송지 추가하기
	void inputNewAddress(AddrDTO aDto);

	//배송지 삭제하기
	void deleteAddress(String no);

	//배송지 정보 가져오기
	AddrDTO getAddress(String no);

	//배송지 수정 처리하기
	void updateAddress(AddrDTO aDto);

}
