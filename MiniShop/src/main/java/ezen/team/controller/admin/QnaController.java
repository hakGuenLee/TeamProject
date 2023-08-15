package ezen.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;
import ezen.team.service.admin.QnaService;


/* 
상품 Q&A 목록 가져오기
상품 Q&A 상세보기
상품 Q&A 답변 등록하기
 */
 
@Controller
@RequestMapping("/QnA")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	//상품 QnA 리스트 이동
	@RequestMapping("/qnaList")
	public String qnaList(
			@RequestParam(value = "cs_code" , defaultValue ="ALL") String cs_code,
            @RequestParam(value = "proc_sts" , defaultValue ="1") String proc_sts,
			PageDTO pagedto,Model model) {
		
	List<QnaDTO> QList = qnaService.qnaList(cs_code, proc_sts, pagedto);
		
	
	model.addAttribute("QList",QList);
	model.addAttribute("search_cd", cs_code);
	model.addAttribute("search_sts", proc_sts);
	model.addAttribute("pageDTO", pagedto);
	
		return "/admin/qnaList";
	}
	
	//상품 QnA 답변페이지 이동
	@GetMapping("/qnaInfo")
	public String qnaInfo() {
			
	   return "/admin/qnaInfo";
	}

	
	
	
	
}
