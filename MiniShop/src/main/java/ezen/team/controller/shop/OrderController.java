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

import ezen.team.domain.CartDTO;
import ezen.team.domain.UserDTO;
import ezen.team.service.CartService;
import ezen.team.service.MyPageService;
import ezen.team.service.OrderService;

/*
주문 페이지 이동(주문정보, 회원정보 같이 출력)
결제수단 선택
주문 완료처리(정보제공 동의박스 유효성 검사, 이상 없을 시 주문 완료처리)
 */


@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MyPageService myPageService;
	
	@PostMapping("inputOrder")
	public String inputOrder(@RequestParam("choiceBuy") String choiceBuy) {
		
		//장바구니에서 구매 할 상품 선택 후 구매정보에 담기 
		String[] pNumArr = choiceBuy.split("/");
		
		if(pNumArr.length > 0) {
			for(String cartNum : pNumArr) {
				orderService.inputOrder(Integer.parseInt(cartNum));
			}
		}
		
		return"redirect:/order/buyPage";
	}
	
	// 장바구니에서 구매하기 클릭시 주문페이지로 이동
	@GetMapping("buyPage")
	public String buyPage(HttpServletRequest requset,Model model) {
		
		HttpSession session =  requset.getSession();
		
		
		
		// 장바구니를 주문 리스트에 담기 ( 보류 )
//		List<CartDTO> list = cartService.getCartList(session);
//		orderService.inputOrder(list);
		
		// 주문 리스트 가져오기
		List<CartDTO> list = orderService.getOrderList(session);
		//UserDTO user = orderService.getUserInfo(session);
		
		UserDTO user = myPageService.getUserInfo(session);
		
		
		
//		System.out.println(list);
		model.addAttribute("list",list);
		model.addAttribute("userDTO",user);
		
		return "/user/buyPage";
	}
	
	// 구매페이지에서 수량 수정하기
	@PostMapping("/updateQty")
	public String updateQty(@RequestParam("no")String cartNo, String pqty) {
		
		cartService.updateQty(cartNo, pqty);
		
		return "redirect:/order/buyPage";
	}
	
	// 구매페이지에서 삭제하기
	@GetMapping("orderDelete")
	public String orderDelete(@RequestParam("no")int no) {
		
		System.out.println(no);
		
		orderService.orderDelete(no);
		
		return "redirect:/order/buyPage";
	}
	
	

	

}
