package ezen.team.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.WishDTO;
import ezen.team.service.CartService;

/*
장바구니 페이지 이동 및 리스트 출력
선택상품 삭제
위시리스트
 */

@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	CartService service;

	//장바구니 페이지 이동
	@GetMapping("/cartList")
	public String cartList() {
		
		return "/user/cartList";
	}
	
	//찜하기 처리하기
	@GetMapping("/wish")
	public String wish(@RequestParam("no") String no, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		service.insertWish(no, session);
		
		return "redirect:wishList";
				
	}
	
	//위시리스트 리스트
	@GetMapping("/wishList")
	public String wishList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		List<WishDTO> list = service.getWish(session);
		
		System.out.println("위시리스트 : " + list);
		
		model.addAttribute("list", list);
		
		return "/user/myPageWish";
		
	}
	
	//위시리스트 삭제
	@GetMapping("/deleteWish")
	public String deleteWish(@RequestParam("no")int no) {
		
		service.deleteWish(no);
		
		return "redirect:wishList";
	}
	
	
}
