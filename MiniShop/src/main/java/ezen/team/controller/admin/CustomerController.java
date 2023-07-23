package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
1:1 문의 목록 가져오기
1:1 문의 상세보기
1:1 문의 답변 등록하기  
 */


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	//1:1문의 리스트 페이지 이동(문의 목록 가져오기)
	@GetMapping("/csList")
	public String csList() {
		
		return "/admin/csList";
	}
	
	//1:1문의 상세보기
	@GetMapping("/csInfo")
	public String csInfo() {
		
		return "/admin/csInfo";
	}
	
	

}
