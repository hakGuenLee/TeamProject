package ezen.team.controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/*
 관리자 로그인 처리
 인증/인가처리 진행(Security)
 관리자 로그아웃 처리 
 */
@Controller
public class LoginController {
	
	//관리자 로그인 페이지 이동
	@GetMapping("/adminLogin")
	public String adminLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception, Model model) {
		

		System.out.println("error : " + error);
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		
		
		
		return "/admin/adminLogin";
	}
	
	//로그아웃
	@GetMapping("/adminLogout")
	public String logout(HttpServletRequest request,
				HttpServletResponse response) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication !=null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);	
		}
		
		return "redirect:/adminLogin";
		
	}
	
	
	//인가예외 발생 처리
	@GetMapping("/denied")
	public String accessDenied(
			@RequestParam(value="exception", required = false) String exception,
			Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		
		return "/admin/denied";
		
	}

}
