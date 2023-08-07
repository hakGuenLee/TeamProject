package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.AddrDTO;
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

}
