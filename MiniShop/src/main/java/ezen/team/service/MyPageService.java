package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import ezen.team.domain.AddrDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
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

	//마이페이지 주문내역 가져오기
	List<OrderDTO> getOrderList(PageDTO pageDTO, HttpSession session);

	//해당 회원의 주문건 수 가져오기
	int getOrderTotal(HttpSession session);

	//해당 회원의 1:1 문의 건수 가져오기
	int getTotalQuestion(HttpSession session);

	//해당 회원의 1:1 문의 리스트 가져오기
	List<CsDTO> getCsList(PageDTO pageDTO, HttpSession session);

	//해당 번호에 맞는 주소지를 기본 배송지로 설정하기
	void defaultAddressSetting(String addrNo, HttpServletRequest request);

	//해당 회원의 배송지 개수 확인하기
	int countAddress(HttpServletRequest request);

}
