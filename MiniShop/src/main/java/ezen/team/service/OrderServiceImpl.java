package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CartDTO;
import ezen.team.domain.UserDTO;
import ezen.team.mapper.OrderMapper;

//OrderController와 연결

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;

	@Override
	public List<CartDTO> getOrderList(HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		String id = user.getUser_id();
		
		List<CartDTO> cartList = mapper.getOrderList(id);
		
		return cartList;
	}

	@Override
	public void inputOrder(int prod_no) {
				mapper.inputOrder(prod_no);
		
	}
	
	
//	@Override // 장바구니를 주문 리스트에 담기 ( 보류 )
//	public void inputOrder(List<CartDTO> list) {
//		
//		mapper.inputOrder(list);
//		
//	}

}
