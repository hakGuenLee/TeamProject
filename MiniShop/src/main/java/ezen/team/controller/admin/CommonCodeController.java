package ezen.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;
import ezen.team.service.admin.CommonCodeService;

//공통코드 호출 처리 컨트롤러

@Controller
public class CommonCodeController {
	
	@Autowired
	CommonCodeService service;
	
	//공통코드 가져오기
	@PostMapping("/getCode")
	@ResponseBody
	public List<CommonCodeDTO> getCode(@RequestParam("code") String code) {
		
		//view에서 넘겨준 code값을 통해 공통코드 리스트 가져오기
		List<CommonCodeDTO> codelist = service.getCode(code);
		

		return codelist;
	}
	
	//상품카테고리 가져오기
	@PostMapping("/getCategory")
	@ResponseBody
	public List<CategoryDTO> getCategory(@RequestParam("category") String category){
		
	//view에서 넘겨준 category 값을 통해 해당 카테고리 리스트 가져오기
	List<CategoryDTO> categorylist = service.getCategory(category);
	
	return categorylist;
		
	}
	
	//팝업창 이미지 파일명 home ajax에 전달
	@RequestMapping("/popWindow")
	@ResponseBody
	public String popWindow(@RequestParam("postno") String postno, Model model) {
		
		System.out.println("postno : " + postno);
		String popImg = service.getPop(postno);
		System.out.println(popImg);

		
		return popImg;
	}

}
