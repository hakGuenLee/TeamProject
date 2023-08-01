package ezen.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@GetMapping("/qnaList")
	public String qnaList(PageDTO pagedto,Model model) {
		
	List<QnaDTO> QList = qnaService.qnaList(pagedto);
		
	System.out.println(QList);
	
	model.addAttribute("QList",QList);
	
		return "/admin/qnaList";
	}
	
	//상품 QnA 답변페이지 이동
	@GetMapping("/qnaInfo")
	public String qnaInfo() {
			
	   return "/admin/qnaInfo";
	}

	
	
	
	
}
