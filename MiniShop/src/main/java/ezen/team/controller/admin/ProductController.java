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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.PageDTO;
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
		List<CategoryDTO> cList = categoryService.cateList();
		
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
	public String productList(PageDTO pagedto, Model model) {

		List<ProductDTO> pList = productService.prodList(pagedto);
		
		model.addAttribute("pList", pList);
		// pagedto는 model 처리 안함, 안해도 PageDTO -> pageDTO 로 받을 수 있음
		
		return "/admin/prodList";
	}

	// 상품별 월별 처리 현황 페이지 이동
	@GetMapping("/monthlyProd")
	public String prodAmount() {

		return "/admin/monthlyProd";
	}
	
	// 상품 수정 페이지 이동
	@GetMapping("/prodUpdate")
	public String prodUpdate(@RequestParam("prod_no") String no,Model model) {
		
		// 상품등록 페이지에 카테고리 띄우기
		List<CategoryDTO> cList = categoryService.cateList();
		
		ProductDTO pdto = productService.prodListByNo(no);
		
		model.addAttribute("pdto",pdto);
		model.addAttribute("cList",cList);
		
		return "/admin/prodUpdate";
	}
	
	// 상품 수정 처리
	@PostMapping("/prodUpdate")
	public String prodUpdate(MultipartHttpServletRequest mhr, HttpServletRequest rq) throws Exception {
		
		productService.prodUpdate(mhr,rq);

		
		return "redirect:/product/prodList";
	}
	
	//상품 삭제
	@GetMapping("/prodDelete")
	public String prodDelete(@RequestParam("prod_no") String no) {
		
		productService.prodDelete(no);
		
		return "redirect:/product/prodList";
	}
		
	
	
	
	

}
