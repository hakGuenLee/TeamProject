package ezen.team.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.team.service.admin.AdminServiceImpl;

/* 
관리자 페이지 이동
관리자 등록페이지 이동
관리자 등록 처리
관리자 로그 확인하기
승인 요청 목록 조회
승인 처리하기 
관리자 리스트 
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminservice;


	
	
	//관리자 메인 페이지 이동
	@GetMapping("/adminHome")
	public String adminHome() {
			
		return "/admin/adminHome";
	}
	
	
	
	//관리자 등록 페이지 이동
	@GetMapping("/adminRegister")
	public String adminRegister() {
				
		return "/admin/adminRegister";
	}
	
	//시스템 로그리스트 페이지 이동
	@GetMapping("/logList")
	public String logList() {
					
	return "/admin/logList";
	}
	
	//승인 요청 목록 페이지 이동(조회)
	@GetMapping("/requestList")
	public String requestList() {
		
		return "/admin/requestList";
	}
	
	
	//관리자 리스트 페이지 이동
	@GetMapping("/adminList")
	public String adminList() {
			
		return "/admin/adminList";
	}
	
	
}
