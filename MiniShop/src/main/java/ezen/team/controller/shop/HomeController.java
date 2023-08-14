package ezen.team.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.team.service.OrderServiceImpl;

/*
홈 화면 이동 
홈 화면 로드 시 팝업, 공지사항 띄우기(승인여부 체크)
홈 화면 상품 이미지 뿌리기 
홈 화면 베스트 리뷰 뿌리기 
 */

@Controller
public class HomeController {
	

	//홈 화면 이동
	@RequestMapping("/")
	public String home() {
		return "home";
	}

	//관리자 메인 페이지 이동
	@GetMapping("/adminHome")
	public String adminHome() {
				
	return "/admin/adminHome";
	}

	
}
