package ezen.team.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
