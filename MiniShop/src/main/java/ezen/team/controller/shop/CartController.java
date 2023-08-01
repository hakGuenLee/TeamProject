package ezen.team.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
장바구니 페이지 이동 및 리스트 출력
선택상품 삭제
 */

@RequestMapping("/cart")
@Controller
public class CartController {

	@GetMapping("cartList")
	public String cartList() {
		
		return "/user/cartList";
	}
	
}
