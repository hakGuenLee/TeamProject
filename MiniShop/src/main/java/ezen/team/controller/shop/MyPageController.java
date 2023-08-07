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

import ezen.team.domain.AddrDTO;
import ezen.team.domain.UserDTO;
import ezen.team.service.MyPageService;


//마이페이지 담당 컨트롤러

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	//마이페이지 홈 이동
	@GetMapping("/myPagehome")
	public String myPagehome() {
		
		return "/user/myPagehome";
	}
	
	
	
	//회원정보 수정 페이지 이동
	@GetMapping("/myInfoUpdate")
	public String myInfoUpdate(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		UserDTO userDto = service.getUserInfo(session);
		
		model.addAttribute("userDTO", userDto);
		
		return"/user/myInfoUpdate";
	}
	
	//회원정보 수정 처리
	@PostMapping("/myInfoUpdate")
	public String myInfoUpdateComplete(UserDTO uDto) {
		
		System.out.println("업데이트 : " + uDto);
		
		service.updateUser(uDto);
		
		return "/user/myPagehome";		
		
	}
	
	//배송지 페이지 이동
	@GetMapping("/myAddress")
	public String myAddressPage(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		List<AddrDTO> list = service.getAddressList(session);
		
		model.addAttribute("list", list);
		
		return "/user/myAddress";
	}
	
	//배송지 추가 페이지 이동
	@GetMapping("/myAddressInput")
	public String newAddress(Model model, HttpSession session) {
		
		UserDTO userDto = (UserDTO) session.getAttribute("userDTO");
		model.addAttribute("userDto", userDto);
		
		return "/user/myNewAddress";
	}
	
	//배송지 추가 등록 처리
	@PostMapping("/myAddressInput")
	public String inputNewAddress(AddrDTO aDto) {
		
		service.inputNewAddress(aDto);
		
		
		return "redirect:myAddress";
	}
	
	//배송지 삭제
	@GetMapping("/addressDelete")
	public String deleteAddress(@RequestParam("no")String no) {
		
		service.deleteAddress(no);
		
		return "redirect:myAddress";
	}
	
	//배송지 수정하기 페이지 이동
	@GetMapping("/addressUpdate")
	public String updateAddress(@RequestParam("no")String no, Model model, HttpSession session) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		
		AddrDTO aDto = service.getAddress(no);		
		
		model.addAttribute("aDto", aDto);
		model.addAttribute("userDto", user);
		
		
		return "/user/addressUpdate";
	}
	
	//배송지 수정 처리하기
	@PostMapping("/addressUpdate")
	public String updateAddress(AddrDTO aDto) {		
		
		service.updateAddress(aDto);
		
		return "redirect:myAddress";
	}
	

	@GetMapping("/myPagePoint")
	public String myPagePoint() {
		
		return "/user/myPagePoint";
	}
	@GetMapping("/myPageProdQna")
	public String myPageProdQna() {
		
		return "/user/myPageProdQna";
	}
	@GetMapping("/myPageQuestion")
	public String myPageQuestion() {
		
		return "/user/myPageQuestion";
	}
	@GetMapping("/myPageWish")
	public String myPageWish() {
		
		return "/user/myPageWish";
	}
	
	
	
	

}
