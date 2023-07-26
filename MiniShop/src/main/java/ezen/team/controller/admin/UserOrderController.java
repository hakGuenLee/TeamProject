package ezen.team.controller.admin;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.OrderDTO;
import ezen.team.service.admin.UserOrderService;


/* 
회원 주문/배송 조회 페이지 이동
주문/배송 상태 변경
 */

@Controller
@RequestMapping("/order")
public class UserOrderController {
	@Autowired
	private UserOrderService userOrderService;
	
	//회원 주문/배송 조회 페이지 이동
	@GetMapping("/orderList")
	public String orderList(Model model) {
			
		return "admin/userorderList";
	}
	
	//회원 주문/배송 페이지에서 회원ID/휴대폰번호 검색기능 처리
	@PostMapping("/orderSearch")
	public String orderSearch(@RequestParam("search") String search, Model model) {
		
		System.out.println("search :" + search);
		
		//id,전화번호 컨캣으로 가져온 값
		String value  = userOrderService.orderSearch(search);

		System.out.println("value : " + value);

		// "/"의 위치값
		int idx = value.indexOf("/");
		
		//value의 마지막 위치값
		int lastidx = value.length()-1;
		
		//id는 첫번째 글자부터 / 전까지의 값
		String id = value.substring(0,idx);
		
		//휴대번호는 / 다음 글자부터 마지막 글자까지의 값
		String phone = value.substring(idx+1,lastidx);
		
		System.out.println(id);
		System.out.println(phone);
		
		//관리자가 검색한 회원id 혹은 연락처로 DB에서 주문내역 가져오기
		 List<OrderDTO> orderList =  userOrderService.getOrderList(id,phone);
		
		
		model.addAttribute("id", id);
		model.addAttribute("phone", phone);
		model.addAttribute("orderList", orderList);
		
		return "admin/userorderList";
	}

	
	//회원 주문/배송 상세 보기
	@GetMapping("/orderInfo")
	public String orderInfo() {
		
		return "/admin/userorderInfo";
	}
	
}
