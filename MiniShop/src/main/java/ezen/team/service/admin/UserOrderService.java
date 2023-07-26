package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.OrderDTO;

public interface UserOrderService {

	//회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색
	String orderSearch(String search);

	//검색한 회원ID 또는 전화번호로 주문내역 가져오기
	List<OrderDTO> getOrderList(String id, String phone);



}
