package ezen.team.mapper.admin;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.OrderDTO;


@Mapper
public interface UserOrderMapper {

	// 회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색 결과 가져오기
	String orderSearch(String search);

	//검색한 회원ID 또는 전화번호로 주문내역 가져오기
	List<OrderDTO> getOrderList(String id, String phone);

}
