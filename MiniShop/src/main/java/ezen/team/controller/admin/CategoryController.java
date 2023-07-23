package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/* 
카테고리 등록 페이지 이동
카테고리 등록 완료 처리
카테고리 리스트 
 */

@Controller
@RequestMapping("/category")
public class CategoryController {

	//카테고리 등록페이지 이동
	@GetMapping("/catRegister")
	public String catRegister() {
		
		return "/admin/catRegister";
	}
	
	//카테고리 리스트
	@GetMapping("/catList")
	public String catList() {
		
		return "/admin/catList";
	}
	
	
}
