package ezen.team.controller.admin;

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
    public String csSearchList(@RequestParam(value = "cs_code" , defaultValue ="ALL") String cs_code,
                             @RequestParam(value = "proc_sts" , defaultValue ="1") String proc_sts,
                             Model model){
    	List<CsDTO> csList = service.csList(cs_code, proc_sts);

    	model.addAttribute("csList", csList);
    	model.addAttribute("search_cd", cs_code);
    	model.addAttribute("search_sts", proc_sts);
    	
        return "/admin/csList";
    }
	
	
	//1:1문의 상세보기
	@GetMapping("/csInfo")
	public String csInfo(int cs_no, String cs_code, Model model) {
		
		CsDTO csDto = service.csInfo(cs_no);
		model.addAttribute("csDto", csDto);
		
		
		
		System.out.println(csDto);
		
		return "/admin/csInfo";
	}
	
	

}
