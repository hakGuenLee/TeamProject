package ezen.team.service.admin;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.OrderDTO;
import ezen.team.mapper.admin.UserOrderMapper;



//UserOrderController

@Service
public class UserOrderServiceImpl implements UserOrderService {

	@Autowired
	UserOrderMapper mapper;
	
	//회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색
	@Override
	public String orderSearch(String search) {

	 String value = mapper.orderSearch(search);
		
		return value;
	}

	//검색한 회원ID 또는 전화번호로 주문내역 가져오기
	@Override
	public List<OrderDTO> getOrderList(String id, String phone) {
		
		List<OrderDTO> orderList = mapper.getOrderList(id, phone); 
		
		return orderList;
	}
	
	



}
