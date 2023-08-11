package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.OrderDTO;
import ezen.team.domain.UserOrderDTO;

public interface UserOrderService {

	//회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색
	String orderSearch(String search);

	//검색한 회원ID 또는 전화번호로 주문내역 가져오기
	List<UserOrderDTO> getOrderList(String id, String phone);

	// 검색한 주문내역 상세보기
	List<UserOrderDTO> orderInfo(String order_no);

	// 검색한 주문내역 상세보기의 회원정보
	UserOrderDTO userorderInfo(String order_no);

	void orderUpdate(UserOrderDTO uodto);

	//주문 내역 모두 가져오기
	List<UserOrderDTO> getAllOrderList();

	//주문 번호를 통해 주문 상세 내역 가져오기
	List<UserOrderDTO> getOrderInfo(String orderNo);



}
