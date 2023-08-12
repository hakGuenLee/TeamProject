package ezen.team.service.admin;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.OrderDTO;
import ezen.team.domain.UserOrderDTO;
import ezen.team.mapper.admin.UserOrderMapper;



//UserOrderController

@Service
public class UserOrderServiceImpl implements UserOrderService {

	@Autowired
	UserOrderMapper mapper;
	
	//회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색
	@Override
	public String orderSearch(String search) {
		
		return mapper.orderSearch(search);
	}

	//검색한 회원ID 또는 전화번호로 주문내역 가져오기
	@Override
	public List<UserOrderDTO> getOrderList(String id, String phone) {
		
		return mapper.getOrderList(id, phone); 
	}

	// 검색한 주문내역 상세보기
	@Override
	public List<UserOrderDTO> orderInfo(String order_no) {
		
		return mapper.orderInfo(order_no);
	}

	// 검색한 주문내역 상세보기의 회원정보
	@Override
	public UserOrderDTO userorderInfo(String order_no) {
		
		
		return mapper.userorderInfo(order_no);
	}

	@Override
	public void orderUpdate(UserOrderDTO uodto) {
			mapper.orderUpdate(uodto);
	}

	//주문내역 모두 가져오기
	@Override
	public List<UserOrderDTO> getAllOrderList() {

		return mapper.getAllOrderList();
	}
	
	
	//주문번호를 통해 주문 상세내역 가져오기
	@Override
	public List<UserOrderDTO> getOrderInfo(String orderNo) {

		return mapper.getOrderDetailInfo(orderNo);
	}

	//주문건 검색하기
	@Override
	public List<UserOrderDTO> searchOrder(String search) {

		return mapper.searchOrder(search);
	}

	//주문 상태 변경하기
	@Override
	public void UpdateStatus(String status, String btnValue) {
		mapper.updateStatus(status, btnValue);
		
	}
	
	



}
