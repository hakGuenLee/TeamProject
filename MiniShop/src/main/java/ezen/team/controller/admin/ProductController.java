package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/* 
상품 등록 페이지 이동
상품 등록 완료 처리
상품 리스트 
상품 월별 처리 현황 페이지 이동
상품 월별 처리 현황 조회 처리
 */


@Controller
@RequestMapping("/product")
public class ProductController {

	//상품 등록 페이지 이동
	@GetMapping("/prodPage")
	public String productRegister() {
		
		return "/admin/prodRegister";
	}
	
	//상품 리스트
	@GetMapping("/prodList")
	public String productList() {
		
		return "/admin/prodList";
	}
	
	//상품별 월별 처리 현황 페이지 이동
	@GetMapping("/monthlyProd")
	public String prodAmount() {
		
		return "/admin/monthlyProd";
	}
	
	
}
