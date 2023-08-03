package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
