package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ezen.team.domain.CartDTO;
import ezen.team.domain.ProductDTO;
import ezen.team.domain.WishDTO;

public interface CartService {

	//위시리스트에 상품 넣기
	void insertWish(String no, HttpSession session);

	//위시리스트 가져오기
	List<WishDTO> getWish(HttpSession session);

	//해당 번호에 해당하는 위시리스트 삭제하기
	void deleteWish(int no);

	//장바구니에 해당 상품 넣기
	void inputCart(CartDTO cartDTO, HttpSession session);

	//해당 아이디에 맞는 장바구니 리스트 가져오기
	List<CartDTO> getCartList(HttpSession session);

	//카트 상품 유무 체크
	CartDTO checkCart(CartDTO cartDTO, HttpSession session);

	//장바구니에 상품이 이미 있을 경우 수량만 1씩 증가
	void modifyQty(int pQty, int cart_no);

	//장바구니 상품 삭제하기
	void CartDelete(String cartNo);

	//장바구니 수량 수정하기
	void updateQty(String cartNo, String pqty);

	WishDTO checkWish(String no, HttpSession session);

	// 상세보기에서 바로 구매하기
	void buyCart(CartDTO cartDTO, HttpSession session);



}
