package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.UserDTO;
import ezen.team.domain.UserInfoHandler;
import ezen.team.mapper.MyPageMapper;

//마이페이지 담당 서비스

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private UserInfoHandler userInfoHandler;

	
	//세션에 담긴 회원 정보를 통해서 유저 정보 가져오기
	@Override
	public UserDTO getUserInfo(HttpSession session) {
		
		String username = userInfoHandler.getUserName(session);
		
		return mapper.getUserInfo(username);
	}

	//회원 정보 수정 처리 완료하기
	@Override
	public void updateUser(UserDTO uDto) {
				
		mapper.userInfoUpdate(uDto);
		
	}

	//회원 아이디에 맞는 배송지 리스트 가져오기
	@Override
	public List<AddrDTO> getAddressList(HttpSession session) {
		
		String id = userInfoHandler.getUserId(session);

		return  mapper.getAddrList(id); 
	}

	//배송지 추가하기
	@Override
	public void inputNewAddress(AddrDTO aDto) {
		mapper.insertNewAddress(aDto);
		
	}

	//배송지 삭제하기
	@Override
	public void deleteAddress(String no) {
		mapper.deleteAddress(no);
		
	}

	//배송지 정보 가져오기
	@Override
	public AddrDTO getAddress(String no) {

		return mapper.getAddrInfo(no);
	}

	//배송지 수정 처리하기
	@Override
	public void updateAddress(AddrDTO aDto) {
		mapper.updateAddress(aDto);
		
	}

	//나의 주문내역 가져오기
	@Override
	public List<OrderDTO> getOrderList(PageDTO pageDTO, HttpSession session) {
		
		String user_id = userInfoHandler.getUserId(session);		
		
		int totalCnt = mapper.getOrderNum(user_id);
		pageDTO.setCntPerPage(5);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return mapper.getOrderList(pageDTO, user_id);
	}

	//해당 회원의 주문 건 수 가져오기
	@Override
	public int getOrderTotal(HttpSession session) {
		
		String id = userInfoHandler.getUserId(session);

		return mapper.getOrderNum(id);
	}

	//해당 회원의 1:1문의 건수 가져오기
	@Override
	public int getTotalQuestion(HttpSession session) {
		
		String id = userInfoHandler.getUserId(session);
		
		return mapper.getTotalQuestion(id);
	}

	//해당 회원의 1:1문의 내역 가져오기
	@Override
	public List<CsDTO> getCsList(PageDTO pageDTO, HttpSession session) {
		
		String user_id = userInfoHandler.getUserId(session);
		
		int totalCnt = mapper.getTotalQuestion(user_id);
		pageDTO.setCntPerPage(5);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return mapper.getCsList(pageDTO, user_id);
	}

	//해당 번호에 맞는 주소지를 기본 배송지로 설정하기
	@Override
	public void defaultAddressSetting(String addrNo, HttpSession session) {
		
		
	
		String id = userInfoHandler.getUserId(session);

		//기본배송지로 되어 있는 주소 번호 받기
		String addressChecked = mapper.checkAddress(id);
		
		//해당 아이디에 이미 기본 배송지가 있는지 확인
		//기본 배송지가 없을 경우 회원이 체크한 주소지 번호에 맞는 주소를 기본배송지로 변경하기
		if(addressChecked == null) {
			mapper.updateDefaultAddress(addrNo);
		}else {
			//기본 배송지로 되어있던 주소번호의 주소는 기본배송지 지우기
			mapper.resetAddress(addressChecked);
			//지운 후 회원이 체크한 주소번호를 기본배송지로 수정
			mapper.updateDefaultAddress(addrNo);
			
		}
		
	}

	//해당 회원의 배송지 개수 확인하기
	@Override
	public int countAddress(HttpSession session) {
				
		String id = userInfoHandler.getUserId(session);
		return mapper.countAddress(id);
	}

}
