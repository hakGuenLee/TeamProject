package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CartDTO;
import ezen.team.domain.ProductDTO;
import ezen.team.domain.WishDTO;

//장바구니, 위시리스트 담당 mapper

@Mapper
public interface CartMapper {

	//상품 번호와 회원 아이디를 통해 위시리스트 상품 넣기
	void insertWish(String no, String id);

	//해당 아이디에 맞는 위시리스트 가져오기
	List<WishDTO> getWishList(String id);

	//해당번호에 해당하는 위시리스트 삭제하기
	void deleteWish(int no);

	//장바구니 상품 넣기
	void insertCart(CartDTO cartDTO, String id);

	//해당 아이디에 맞는 장바구니 상품 가져오기
	List<CartDTO> getCartList(String id);

	//카트 상품 유무 체크
	CartDTO checkCart(String id, String no);

	//장바구니에 상품이 이미 있을 경우 수량만 1씩 증가
	void modifyQty(int pQty, int cart_no);

	//장바구니 상품 삭제하기
	void deleteCart(String cartNo);

	//장바구니 수량 수정하기
	void updateQty(String cartNo, String pqty);

	// 찜바구니 유무 체크
	WishDTO checkWish(String id, String no);

	// 상세보기에서 바로 구매하기
	void buyCart(CartDTO cartDTO, String id);

}
