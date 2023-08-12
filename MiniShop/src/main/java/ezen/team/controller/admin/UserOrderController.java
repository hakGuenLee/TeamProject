package ezen.team.controller.admin;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.team.domain.UserOrderDTO;
import ezen.team.service.admin.UserOrderService;


/* 
회원 주문/배송 조회 페이지 이동
주문/배송 상태 변경
 */

@Controller
@RequestMapping("/orderManager")
public class UserOrderController {
	@Autowired
	private UserOrderService userOrderService;

	
	//회원 주문/배송 리스트 페이지 이동
	@GetMapping("/AllOrder")
	public String orderAll(Model model) {
	
		List<UserOrderDTO> list = userOrderService.getAllOrderList();				
		
		model.addAttribute("list", list);

		return "admin/orderAll";
	}
	
	//회원 주문/배송 리스트 검색
	@PostMapping("/orderListSearch")
	public String orderListSearch(String search, Model model) {
		
		List<UserOrderDTO> list = userOrderService.searchOrder(search);
		
		if(list == null) {
			String message = "검색 결과 주문 내역이 존재하지 않습니다!";
			model.addAttribute("Msg", message);
			return "/admin/orderAll";
		}
		
		model.addAttribute("list", list);
		
		return "/admin/orderAll";
		
	}
	
	//주문 상태 변경하기
	@PostMapping("/statusUpdate")
	@ResponseBody
	public String statusUpdate(@RequestParam(value="status", required=false)String status,
			@RequestParam(value="BtnValue", required=false) String BtnValue) {
		System.out.println("넘어온 상태값 : " + status);
		System.out.println("넘어온 주문번호 : " + BtnValue);
		
		userOrderService.UpdateStatus(status, BtnValue);
		
		
		return "/admin/";
	}
	
	
	
	//회원 주문/배송 리스트에서 수정 페이지 이동
		@GetMapping("/orderInfo")
		public String orderInfo(@RequestParam("order_no")String orderNo, Model model) {
			System.out.println("주문번호 : " + orderNo);
			List<UserOrderDTO> orderDTO = userOrderService.getOrderInfo(orderNo);
			
			System.out.println("주문상세내역 : " + orderDTO);
			model.addAttribute("list", orderDTO);
			
			return "/admin/orderDetailInfo";
		}
	

	
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
		 List<UserOrderDTO> orderList =  userOrderService.getOrderList(id,phone);
		
		
		model.addAttribute("id", id);
		model.addAttribute("phone", phone);
		model.addAttribute("search", search);
		model.addAttribute("orderList", orderList);
		
		return "admin/userorderList";
	}

	
	
	
	
	
	
	
//	//회원 주문/배송 상세 보기
//	@GetMapping("/orderInfo")
//	public String orderInfo(@RequestParam("order_no")String order_no,
//							@RequestParam("search")String search, Model model) {
//
//		// 검색한 주문내역 상세보기
//		List<UserOrderDTO> UOList = userOrderService.orderInfo(order_no);
//		
//		// 검색한 주문내역 상세보기의 회원정보
//		UserOrderDTO UOdto = userOrderService.userorderInfo(order_no);
//		
//		model.addAttribute("order_no",order_no);
//		model.addAttribute("search",search);
//		model.addAttribute("uoList",UOList);
//		model.addAttribute("UOdto",UOdto);
//		
//		return "/admin/userorderInfo";
//	}
	
	//회원 주문 상세보기 처리상태 업데이트
//	@PostMapping("orderUpdate")
//	public String orderUpdate(@RequestParam("search")String search, UserOrderDTO uodto) {
//		
//		userOrderService.orderUpdate(uodto);
//		
//		return "redirect:/order/orderSearch?search="+search;
//	}
	
	
}
