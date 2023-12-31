package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.CartDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.UserDTO;

public interface OrderService {

	// 주문 상품 가져오기
	List<CartDTO> getOrderList(HttpSession session);

	//카트에서 주문하기 클릭시 N => Y 로 바꿔주기
	void inputOrder(int prod_no);

	// 주문하기에서 삭제 클릭시 Y => N 으로 바꿔주기
	void orderDelete(int no);

	// 결제 시 주문정보를 테이블에 넣어주고, 카트에서 정보 지워주기
	String orderRegister(List<CartDTO> list, UserDTO user, int point);

	// 주문 후 결제내역 보기
	OrderDTO getOrderInfo(String order_no);


	// myPage 에서 주문 상세 보기
	List<OrderDTO> getOrderDetail(String order_no);

	//해당 회원의 배송지 별칭 목록 가져오기
	List<String> getNickAddr(HttpSession session);

	//별칭에 맞는 주소 가져오기
	AddrDTO getAddrInfo(String nickname, HttpSession session);

	//기본주소 가져오기
	AddrDTO getDefAddress(String addrName, HttpSession session);

	List<OrderDTO> dateSearch(PageDTO pageDTO, HttpSession session, String stt_ymd, String end_ymd);






	// 장바구니를 주문 리스트에 담기 ( 보류 )
//	void inputOrder(List<CartDTO> list);

}
