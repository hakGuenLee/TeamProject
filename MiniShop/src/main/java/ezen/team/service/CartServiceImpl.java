package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CartDTO;
import ezen.team.domain.ProductDTO;
import ezen.team.domain.UserDTO;
import ezen.team.domain.WishDTO;
import ezen.team.mapper.CartMapper;

//CartController와 연결

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper mapper;
	
	
	//위시리스트 상품 넣기
	@Override
	public void insertWish(String no, HttpSession session) {
						
		UserDTO uDto = (UserDTO) session.getAttribute("userDTO");
		String id = uDto.getUser_id();
		
		mapper.insertWish(no, id);
		
	}

	//위시리스트 가져오기
	@Override
	public List<WishDTO> getWish(HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		
		String id = user.getUser_id();
		
		List<WishDTO> list = mapper.getWishList(id);
		
		return list;
	}

	//해당번호에 해당하는 위시리스트 삭제하기
	@Override
	public void deleteWish(int no) {
		mapper.deleteWish(no);
		
	}

	//장바구니에 상품 넣기
	@Override
	public void inputCart(CartDTO cartDTO, HttpSession session) {
		
		UserDTO uDto = (UserDTO) session.getAttribute("userDTO");
		
		String id = uDto.getUser_id();
//		String no = cartDTO.getProd_no();
		
		
		mapper.insertCart(cartDTO, id);
	}
	

	//해당 아이디에 맞는 장바구니 상품 가져오기
	@Override
	public List<CartDTO> getCartList(HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		String id = user.getUser_id();
		
		List<CartDTO> cartList = mapper.getCartList(id);
		
		return cartList;
	}

	//카트 상품 유무 여부 확인
	@Override
	public CartDTO checkCart(CartDTO cartDTO, HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		String id = user.getUser_id();
		String no = cartDTO.getProd_no();
		
		CartDTO cDto = mapper.checkCart(id, no);
		
		return cDto;
	}

	//장바구니에 상품이 이미 있을 경우 수량만 1씩 증가
	@Override
	public void modifyQty(int pQty, int cart_no) {
		mapper.modifyQty(pQty, cart_no);
		
	}

	//장바구니 상품 삭제하기
	@Override
	public void CartDelete(String cartNo) {
		mapper.deleteCart(cartNo);
		
	}

	//장바구니 수량 수정하기
	@Override
	public void updateQty(String cartNo, String pqty) {
		mapper.updateQty(cartNo, pqty);
		
	}

	@Override
	public WishDTO checkWish(String no, HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		String id = user.getUser_id();
		
		WishDTO wishDTO = mapper.checkWish(id, no);
		
		return wishDTO;
	}

}
