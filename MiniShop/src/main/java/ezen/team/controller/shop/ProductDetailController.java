package ezen.team.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.ProductDTO;
import ezen.team.service.ProductDetailService;

//상품 상세보기 담당 컨트롤러


@Controller
@RequestMapping("/prodDetail")
public class ProductDetailController {

	@Autowired
	ProductDetailService service;
	
	//상품 상세 페이지 이동하기
	@GetMapping("/prodInfo")
	public String prodInfoPage(@RequestParam("no") String no, Model model) {
		
		ProductDTO pDto = service.getProductInfo(no);
		
		model.addAttribute("dto", pDto);
		
		return "/user/ProductInfo";
	}
	
	
}
