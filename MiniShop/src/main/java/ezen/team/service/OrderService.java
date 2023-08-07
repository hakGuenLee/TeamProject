package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ezen.team.domain.CartDTO;

public interface OrderService {

	List<CartDTO> getOrderList(HttpSession session);

	void inputOrder(int prod_no);

	void orderDelete(int no);
	

	// 장바구니를 주문 리스트에 담기 ( 보류 )
//	void inputOrder(List<CartDTO> list);

}
