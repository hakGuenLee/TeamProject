package ezen.team.mapper.admin;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.OrderDTO;
import ezen.team.domain.UserOrderDTO;


@Mapper
public interface UserOrderMapper {

	// 회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색 결과 가져오기
	String orderSearch(String search);

	//검색한 회원ID 또는 전화번호로 주문내역 가져오기
	List<UserOrderDTO> getOrderList(String id, String phone);
	
	// 검색한 주문내역 상세보기
	List<UserOrderDTO> orderInfo(String order_no);

	// 검색한 주문내역 상세보기의 회원정보
	UserOrderDTO userorderInfo(String order_no);

	void orderUpdate(UserOrderDTO uodto);

	//주문내역 모두 가져오기
	List<UserOrderDTO> getAllOrderList();

	//주문번호를 통해 주문 상세내역 가져오기
	List<UserOrderDTO> getOrderDetailInfo(String orderNo);

	//주문건 검색하기
	List<UserOrderDTO> searchOrder(String search);

	//주문상태 변경하기
	void updateStatus(String status, String btnValue);

}
