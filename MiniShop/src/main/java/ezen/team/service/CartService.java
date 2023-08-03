package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ezen.team.domain.WishDTO;

public interface CartService {

	//위시리스트에 상품 넣기
	void insertWish(String no, HttpSession session);

	//위시리스트 가져오기
	List<WishDTO> getWish(HttpSession session);

	//해당 번호에 해당하는 위시리스트 삭제하기
	void deleteWish(int no);

}
