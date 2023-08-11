package ezen.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.PageDTO;
import ezen.team.service.admin.CategoryService;

/* 
카테고리 등록 페이지 이동
카테고리 등록 완료 처리
카테고리 리스트 
 */

@Controller
@RequestMapping("/category")
public class CategoryController {

   @Autowired
   private CategoryService categoryService;
   
   //카테고리 등록페이지 이동
   @GetMapping("/catRegister")
   public String catRegister() {
      
      return "/admin/catRegister";
   }
   //카테고리 등록 처리
   @PostMapping("/catRegister")
   public String catRegister(CategoryDTO cdto) {
      
	  // input 데이터를 DTO로 한번에 받아와서 서비스로 데이터 보내주기
	  categoryService.catRegister(cdto);
	   
      return "redirect:/category/catList";
   }
   
   
   //카테고리 리스트
   @GetMapping("/catList")
   public String catList(PageDTO pagedto, Model model) {
      
       
      List<CategoryDTO> cList = categoryService.catList(pagedto);
      
      model.addAttribute("cList",cList); // 받아온 카테고리 리스트를 cList , Model객체로 return페이지에 보냄
      
      return "/admin/catList";
   }
   
   //카테고리 수정페이지 이동
   @GetMapping("/catUpdate")
   public String catUpdate(@RequestParam("no")String no
		   					, Model model) {
	   
	  CategoryDTO cdto = categoryService.catListByNo(no);
	  
	  model.addAttribute("cdto",cdto);
	   
	   return "/admin/catUpdate";
   }
   
   //카테고리 수정 처리
   @PostMapping("/catUpdate")
   public String catUpdate(CategoryDTO cdto) {
	   
	  categoryService.catUpdate(cdto);
	   
	   return "redirect:/category/catList";
   }
   
   //카테고리 삭제 처리 (삭제는 최고관리자만 할 수 있도록 view에서 설정)
   @GetMapping("/catDelete")
   public String catDelete(@RequestParam("no")String no) {
	   
	   categoryService.deleteCategory(no);
	   
	   return "redirect:/category/catList";
	   
   }
   

   
}
