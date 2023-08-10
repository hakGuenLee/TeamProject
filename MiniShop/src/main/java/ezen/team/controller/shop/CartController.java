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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.team.domain.CartDTO;
import ezen.team.domain.ProductDTO;
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
	public String cartList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		List<CartDTO> list = service.getCartList(session);
		
		model.addAttribute("list", list);
		
		return "/user/cartList";
	}
	

	
	//장바구니 담기
	@PostMapping("/inputCart")
//			public String inputCart(@RequestParam("no") String no,
//					@RequestParam("opCode") String opCode, 
//					@RequestParam("pQty") String pQty2,
	public String inputCart(CartDTO cartDTO,
			HttpServletRequest request
			, Model model
			, RedirectAttributes redirect) {

		
		HttpSession session = request.getSession();
		
		//카트 상품 유무 체크
		CartDTO cDto = service.checkCart(cartDTO, session);
		
		if(cDto == null) { // 카트에 담겨있지 않으면 카트에 담고
			
			service.inputCart(cartDTO,session);
			
		}else { // 카트에 이미 담겨있으면 메시지를 띄우자
//			int pQty = Integer.parseInt( cDto.getQty() + 1);
//			service.modifyQty(pQty, cDto.getCart_no());
			
//			model.addAttribute("msg","장바구니나 구매목록에 이미 있는 상품입니다.");
			
			String referer = (String)request.getHeader("REFERER");
			
			redirect.addFlashAttribute("msg", "이미 있어요");
			
			return "redirect:"+referer;
			
		}

		return "redirect:cartList";
	}
	
	
	//장바구니 상품 수량 수정하기
	@PostMapping("/updateQty")
	public String updateQty(@RequestParam("no")String cartNo, String pqty) {
		
		service.updateQty(cartNo, pqty);
		
		return "redirect:cartList";
	}
	
	//장바구니 상품 삭제하기
	@GetMapping("/cartDelete")
	public String cartDelete(@RequestParam("no") String cartNo) {
		
		service.CartDelete(cartNo);
		
		return "redirect:cartList";
		
	}
	
	//찜하기 처리하기
	@GetMapping("/wish")
	public String wish(@RequestParam("no") String no, HttpServletRequest request
						, RedirectAttributes redirect) {
		
		HttpSession session = request.getSession();

		//카트 상품 유무 체크
				WishDTO wishDTO = service.checkWish(no, session);
				
				if(wishDTO == null) { // 카트에 담겨있지 않으면 카트에 담고
					
					service.insertWish(no, session);
					
				}else { // 카트에 이미 담겨있으면 메시지를 띄우자
//					int pQty = Integer.parseInt( cDto.getQty() + 1);
//					service.modifyQty(pQty, cDto.getCart_no());
					
//					model.addAttribute("msg","장바구니나 구매목록에 이미 있는 상품입니다.");
					
					String referer = (String)request.getHeader("REFERER");
					
					redirect.addFlashAttribute("msgWish", "이미 있어요");
					
					return "redirect:"+referer;
					
				}
		
		
		
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
