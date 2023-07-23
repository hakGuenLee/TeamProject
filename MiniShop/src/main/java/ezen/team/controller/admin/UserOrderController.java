package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/* 
회원 주문/배송 조회 페이지 이동
주문/배송 상태 변경
 */

@Controller
@RequestMapping("/order")
public class UserOrderController {

	//회원 주문/배송 조회 페이지 이동
	@GetMapping("/orderList")
	public String orderList() {
		
		return "admin/userorderList";
	}
	
	//회원 주문/배송 상세 보기
	@GetMapping("/orderInfo")
	public String orderInfo() {
		
		return "/admin/userorderInfo";
	}
	
}
