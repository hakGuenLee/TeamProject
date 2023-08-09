package ezen.team.service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.CartDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.UserDTO;
import ezen.team.mapper.OrderMapper;

//OrderController와 연결

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;

	// 카트에서 buy_yn 이 Y 인 것을 가져온다
	@Override
	public List<CartDTO> getOrderList(HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		String id = user.getUser_id();
		
		List<CartDTO> cartList = mapper.getOrderList(id);
		
		return cartList;
	}

	// 카트에서 주문 할 상품들을 buy_yn 을 Y로 바꿔준다
	@Override
	public void inputOrder(int prod_no) {
				mapper.inputOrder(prod_no);
		
	}

	// 주문상품 중 구매하지 않을 상품을 N으로 바꿔준다
	@Override
	public void orderDelete(int no) {
		mapper.orderDelete(no);
		
	}

	// 주문 후 결제를 하게 되면 주문마스터, 주문디테일에 정보를 넣어주고
	// 카트에서 정보를 지워준다
	@Override
	public String orderRegister(List<CartDTO> list, UserDTO user) {
		
//		String orderNo = Random
		
		// 현재 날짜/시간 ( 주문 번호 )
		LocalDateTime now = LocalDateTime.now();
		
		// String으로 변환과 동시에 포맷하기
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		// 시분초까지 같을 확률이 있으니 랜덤으로 그 확률을 없애줌
		int orderNo = (int) (Math.random() * 9) + 1;

		// 주문번호
		String order_no = (formatedNow+orderNo);
		// user에 order_no 넣어줘서 한번에 입력시키면서 넘겨주기
		user.setOrder_no(order_no);
		
		
		// 오더마스테어 주문 넣기
		mapper.OMRegister(user);
		
		// 오더디테일에 주문 넣기
		mapper.orderRegister(list,order_no);
		
		//카트에서 주문 지우기
		mapper.DeleteOrder(list);
		
		return order_no;
	}

	@Override
	public OrderDTO getOrderInfo(String order_no) {
		return mapper.getOrderInfo(order_no);
	}

	//해당 회원의 배송지 별칭 목록 가져오기
	@Override
	public List<String> getNickAddr(HttpSession session) {
		
		UserDTO uDto = (UserDTO) session.getAttribute("userDTO");
		String id = uDto.getUser_id();
		
		List<String> list = mapper.getNickAddr(id);
		return list;
	}

	//별칭에 맞는 주소 가져오기
	@Override
	public AddrDTO getAddrInfo(String nickname, HttpServletRequest request) {
		
		HttpSession session = (HttpSession) request.getSession();
		UserDTO uDto = (UserDTO) session.getAttribute("userDTO");
		String id = uDto.getUser_id();
		
		AddrDTO aDto = mapper.getAddrInfo(nickname, id);
		return aDto;
	}

	//기본주소 가져오기
	@Override
	public AddrDTO getDefAddress(String addrName, HttpServletRequest request) {
		
		HttpSession session = (HttpSession) request.getSession();
		UserDTO uDto = (UserDTO) session.getAttribute("userDTO");
		String id = uDto.getUser_id();
		
		AddrDTO aDto = mapper.getDefaultAddr(id, addrName);
		
		
		return aDto;
	}


	
	
//	@Override // 장바구니를 주문 리스트에 담기 ( 보류 )
//	public void inputOrder(List<CartDTO> list) {
//		
//		mapper.inputOrder(list);
//		
//	}

}
