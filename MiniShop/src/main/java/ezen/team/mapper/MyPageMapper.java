package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.UserDTO;

//마이페이지 담당 mapper

@Mapper
public interface MyPageMapper {

	//로그인한 회원의 아이디 값을 통해 유저 정보 가져오기
	UserDTO getUserInfo(String username);

	//회원정보 수정하기
	void userInfoUpdate(UserDTO uDto);

	//해당 아이디에 맞는 배송지 리스트 가져오기
	List<AddrDTO> getAddrList(String id);

	//배송지 추가하기
	void insertNewAddress(AddrDTO aDto);

	//배송지 삭제하기
	void deleteAddress(String no);

	//배송지 정보 가져오기
	AddrDTO getAddrInfo(String no);

	//배송지 수정하기
	void updateAddress(AddrDTO aDto);

	//해당 아이디에 맞는 주문내역 가져오기
	List<OrderDTO> getOrderList(String id);

	//해당 아이디의 주문 건수 가져오기
	int getOrderNum(String id);

	//해당 아이디의 1:1문의 건수 가져오기
	int getTotalQuestion(String id);

	//해당 아이디의 1:1문의 리스트 가져오기
	List<CsDTO> getCsList(String id);

	//해당 번호에 맞는 주소지를 기본 배송지로 설정하기
	void updateDefaultAddress(String addrNo);

	//해당 아이디에 기본 배송지가 있는지 확인
	String checkAddress(String id);

	//기본 배송지로 되어있던 주소번호의 주소는 기본배송지 지우기
	void resetAddress(String addressChecked);

	//해당 아이디의 배송지 개수 확인
	int countAddress(String id);

}
