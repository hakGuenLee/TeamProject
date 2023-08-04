package ezen.team.controller.admin;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;
import ezen.team.service.admin.CommonCodeService;
import ezen.team.service.admin.CustomerService;

/*
1:1 문의 목록 가져오기
1:1 문의 상세보기
1:1 문의 답변 등록하기  
 */

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService service;
	
	//1:1문의 리스트 페이지 이동(문의 목록 가져오기)
//	@GetMapping("/csList")
//	public String csList(Model model) {
////		List<CsDTO> csList = service.csList();
////		System.out.println(csList);
////		model.addAttribute("csList", csList);
//		return "/admin/csList";
//	}
	
	// 1:1 문의 검색
    @RequestMapping("/csList")
    public String csSearchList(
    		@RequestParam(value = "cs_code" , defaultValue ="ALL") String cs_code,
            @RequestParam(value = "proc_sts" , defaultValue ="1") String proc_sts,
            PageDTO pageDto, Model model){
    	List<CsDTO> csList = service.csList(cs_code, proc_sts, pageDto);

    	model.addAttribute("csList", csList);
    	System.out.println("csList : " + csList);
    	model.addAttribute("search_cd", cs_code);
    	model.addAttribute("search_sts", proc_sts);
    	    	
    	
        return "/admin/csList";
    }
	
	
	//1:1문의 상세보기
	@GetMapping("/csInfo")
//	public String csInfo(int cs_no, String cs_code, Model model) {
	public String csInfo(int cs_no, int proc_sts, Model model) {	
		CsDTO csDto = service.csInfo(cs_no, proc_sts);
		
		System.out.println("csDto :::::: " + csDto);
		System.out.println("댓글 내용 : " + csDto.getCsre_con());
		
		model.addAttribute("csDto", csDto);
		
		
		
//		System.out.println("csDto :: " + csDto.toString());
		
		return "/admin/csInfo";
	}
	
	// 1:1답글 등록
	@PostMapping("/csReply")
	public String csReply(@RequestParam("csre_con") String csre_con,
						  int cs_no, String proc_id, Model model) {
		System.out.println("cs_no:::::::::::::" + cs_no);
		
		service.csReply(cs_no, csre_con, proc_id);
		
//		CsDTO csDto = service.csReply(cs_no, csre_con, proc_id);
		
//		model.addAttribute("csDto", csDto);
		
		
		return "/admin/csList";
		
	}
	
	
	
	

}
