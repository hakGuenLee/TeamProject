package ezen.team.controller.shop;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.CartDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
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
		// 장바구니를 주문 리스트에 담기 ( 보류 )
//		List<CartDTO> list = cartService.getCartList(session);
//		orderService.inputOrder(list);
		HttpSession session =  requset.getSession();
		
		// 주문 리스트 가져오기
		List<CartDTO> list = orderService.getOrderList(session);
		//UserDTO user = orderService.getUserInfo(session);
		
		//해당 회원의 배송지 별칭 목록 가져오기
		List<String> nicknameList = orderService.getNickAddr(session);
		System.out.println("배송지별칭목록 : " + nicknameList);
		UserDTO user = myPageService.getUserInfo(session);
		
//		System.out.println(list);
		model.addAttribute("list",list);
		model.addAttribute("userDTO",user);
		model.addAttribute("nickList",nicknameList);
		
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
		
		orderService.orderDelete(no);
		
		return "redirect:/order/buyPage";
	}
	
	// 구매페이지에서 구매하기
	@RequestMapping("/buyNow")
	public String buyNow(@RequestParam("point") int point,
							HttpServletRequest requset,RedirectAttributes reAttr) {
		
		System.out.println(point);
		
		// 로그인한 회원 정보 가져오기
		HttpSession session =  requset.getSession();
		UserDTO user = myPageService.getUserInfo(session);

		// 구매할 상품 정보 가져오기 buy_yn이 Y 인 것
		List<CartDTO> list = orderService.getOrderList(session);
		
		// 가져온 정보들을 주문정보에 넣기
		//주문정보 (오더마스터) 바로 가져오기
		String order_no =  orderService.orderRegister(list,user,point);
		
		reAttr.addFlashAttribute("order_no",order_no);
		
		return "redirect:/order/buyInfo";
	}
	
	// 구매 후 주문내역 보기(+페이지이동)
	@GetMapping("buyInfo")
	public String buyInfo(@ModelAttribute("order_no")String order_no,Model model) {
		
		System.out.println("buyInfo 에서의 "+order_no);

		OrderDTO orderDTO = orderService.getOrderInfo(order_no);
		
		System.out.println(orderDTO.getUser_id());
		
		model.addAttribute("orderDTO",orderDTO);
		
		return "/user/buyInfo";
	}
	

	// myPage 에서 주문 상세 보기
	@GetMapping("/orderDetail")
	public String orderDetail(@RequestParam("order_no")String order_no 
									, Model model) {
		
		List<OrderDTO> list = orderService.getOrderDetail(order_no);
		
		model.addAttribute("list",list);
		model.addAttribute("order_no",order_no);
	
		return "/user/orderDetail";

	}
	//별칭에 맞는 주소 가져오기
	@PostMapping("/getAddressInfo")
	@ResponseBody
	public AddrDTO getAddress(@RequestParam("nickname") String nickname, HttpSession session) {
	
		System.out.println("넘어온 배송지목록 값:" + nickname);
		
		if(nickname == "기본주소") {
			System.out.println("기본주소 명령 실행!");
			AddrDTO aDto1 = orderService.getDefAddress(nickname, session);
			return aDto1;
		}
		
			AddrDTO aDto = orderService.getAddrInfo(nickname, session);
			
			System.out.println("가져온 배송지 주소 : " + aDto);
					
			return aDto;			
	}


	//기본주소 가져오기
	@PostMapping("/getDefAddress")
	@ResponseBody
	public AddrDTO getDefAddress(@RequestParam(value="addrName", required=false) String addrName, HttpSession session) {
		
		System.out.println("넘어온 기본주소 : " + addrName);
		AddrDTO aDto = orderService.getDefAddress(addrName, session);

		return aDto;

	}
	
	// 마이페이지에서 주문 기간으로 조회하기
	@PostMapping("/dateSearch")
	public String dateSearch(@RequestParam("stt_ymd")String stt_ymd,
							@RequestParam("end_ymd")String end_ymd,
							PageDTO pageDTO,
							HttpSession session,
							Model model) {
		
		
		
		List<OrderDTO> list = orderService.dateSearch(pageDTO, session, stt_ymd, end_ymd);
		
		model.addAttribute("list",list);
		
		return "/user/myPagehome";
	}
	
	
	

}



	


