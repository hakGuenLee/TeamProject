package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/*
 관리자 로그인 처리
 관리자 로그아웃 처리 
 */
@Controller
@RequestMapping("/aLogin")
public class LoginController {
	
	//관리자 로그인 페이지 이동
	@GetMapping("/adminLogin")
	public String adminLogin() {
		
		return "/admin/adminLogin";
	}

}
