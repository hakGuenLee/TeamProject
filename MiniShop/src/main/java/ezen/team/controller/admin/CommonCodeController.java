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
import ezen.team.domain.ProductDTO;
import ezen.team.service.admin.CommonCodeService;

//공통코드 호출 처리 컨트롤러

@Controller
public class CommonCodeController {
	
	@Autowired
	CommonCodeService service;
	
	
	//공통코드 리스트 가져오기
	@PostMapping("/getCode")
	@ResponseBody
	public List<CommonCodeDTO> getCode(@RequestParam("code") String code) {
		
		//view에서 넘겨준 code값을 통해 공통코드 리스트 가져오기
		List<CommonCodeDTO> codelist = service.getCode(code);
		

		return codelist;
	}

	//상품카테고리 가져오기
	@PostMapping("/getProdCategoryList")
	@ResponseBody
	public List<CategoryDTO> categoryList(@RequestParam("categoryCode") String catCode){
		
		//view에서 넘겨준 catCode값을 통해 상품 카테고리 리스트 가져오기
		List<CategoryDTO> catList = service.getProdCategory(catCode);		
		
		return catList;
		
		
	}
	
	//홈 화면 상품 박스 출력하기
	@PostMapping("/getHomeProdBox")
	@ResponseBody
	public List<ProductDTO> prodBox(@RequestParam("codeNum") String ctNo){
		
		System.out.println("ctno : " + ctNo);
		
		//view에서 넘겨준 codeNum을 통해 해당 카테고리 번호에 맞는 상품 정보 가져오기
		List<ProductDTO> prodList = service.getProdBox(ctNo);
		
		System.out.println("홈화면 상품 리스트 : " + prodList);
		
		
		return prodList;
		
	}
	
	
	//홈 화면 채소 버튼 클릭 시 상품 가져오기
	@PostMapping("/getVegeBox")
	@ResponseBody
	public List<ProductDTO> getVegeBox(@RequestParam("codeNum") String ctNo){
		
		System.out.println("ctno : " + ctNo);
		
		//view에서 넘겨준 codeNum을 통해 해당 카테고리 번호에 맞는 상품 정보 가져오기
		List<ProductDTO> prodList = service.getProdBox(ctNo);
		
		System.out.println("홈화면 상품 리스트 : " + prodList);
		
		
		return prodList;
		
	}
	

	
}
