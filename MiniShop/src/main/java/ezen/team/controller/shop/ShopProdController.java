package ezen.team.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.team.domain.ProductDTO;
import ezen.team.service.ShopProdService;

/*
 제품 페이지 이동
 쇼핑몰에 제품 불러오기
 제품 상세보기
 */
@Controller
@RequestMapping("/sProduct")
public class ShopProdController {
	
	@Autowired
	private ShopProdService service;
	
	

	//과일 페이지 이동 페이지 이동
	@GetMapping("/fruitPage0")
	public String fruit() {
		return "/user/fruit";
	}
	
	//견과/특용작물 페이지 이동
	@GetMapping("/fruitPage1")
	public String nuts() {
		return "/user/nuts";
	}
	
	//냉동과일 페이지 이동
	@GetMapping("/fruitPage2")
	public String icefruit() {
		return "/user/icefruit";
	}
	
	//잎채소 페이지 이동
	@GetMapping("/vegePage0")
	public String leap() {
		return "/user/leap";
	}
	
	//열매채소 페이지 이동
	@GetMapping("/vegePage1")
	public String berry() {
		return "/user/berry";
	}
	
	//뿌리채소 페이지 이동
	@GetMapping("/vegePage2")
	public String rootVege() {
		return "/user/rootVege";
	}
	
	//버섯 페이지 이동
	@GetMapping("/vegePage3")
	public String mushroom() {
		return "/user/mushroom";
	}
	
	//나물 페이지 이동
	@GetMapping("/vegePage4")
	public String greens() {
		return "/user/greens";
	}
	
	//한우 페이지 이동
	@GetMapping("/meetPage0")
	public String KoreaCow() {
		return "/user/cow";
	}
	
	//돈육 페이지 이동
	@GetMapping("/meetPage1")
	public String pig() {
		return "/user/pig";
	}
	
	//닭/오리 페이지 이동
	@GetMapping("/meetPage2")
	public String chicken() {
		return "/user/chicken";
	}
	
	//유정란 페이지 이동
	@GetMapping("/meetPage3")
	public String egg() {
		
		List<ProductDTO> list = service.getEggList();
		
		
		return "/user/egg";
	}
	
	//아우터 페이지 이동
	@GetMapping("/clothPage0")
	public String outer() {
		return "/user/outer";
	}
	
	//팬츠 페이지 이동
	@GetMapping("/clothPage1")
	public String pants() {
		return "/user/pants";
	}
	
	//스커트 페이지 이동
	@GetMapping("/clothPage2")
	public String skirt() {
		return "/user/skirt";
	}
	
	//상의 페이지 이동
	@GetMapping("/clothPage3")
	public String top() {
		return "/user/top";
	}
	
	//주방가전 페이지 이동
	@GetMapping("/electronicPage0")
	public String homeElectro() {
		return "/user/homeElectro";
	}
	
	//생활가전 페이지 이동
	@GetMapping("/electronicPage1")
	public String lifeElectro() {
		return "/user/lifeElectro";
	}
	
	//욕실가전 페이지 이동
	@GetMapping("/electronicPage2")
	public String bathElectro() {
		return "/user/bathElectro";
	}
	
	
	
	
	

}
