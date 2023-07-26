package ezen.team.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.ProductDTO;
import ezen.team.service.admin.CategoryService;
import ezen.team.service.admin.ProductService;

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

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;

	// 상품 등록 페이지 이동
	@GetMapping("/prodRegister")
	public String productRegister(Model model) {

		// 상품등록 페이지에 카테고리 띄우기
		List<CategoryDTO> cList = categoryService.catList();
		
		model.addAttribute("cList",cList);

		return "/admin/prodRegister";
	}
	
	// 상품 등록 처리
	@PostMapping("/prodRegister")
	public String prodRegister(MultipartHttpServletRequest mhr, 
			HttpServletRequest request) throws Exception {
		
		productService.prodRegister(mhr,request);
		
	
		return "redirect:/product/prodList";
		
	}
	

	// 상품 리스트
	@GetMapping("/prodList")
	public String productList(Model model) {

		List<ProductDTO> pList = productService.prodList();
		
		model.addAttribute("pList", pList);
		
		return "/admin/prodList";
	}

	// 상품별 월별 처리 현황 페이지 이동
	@GetMapping("/monthlyProd")
	public String prodAmount() {

		return "/admin/monthlyProd";
	}
	
	
	
	
	

}
