package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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

}
