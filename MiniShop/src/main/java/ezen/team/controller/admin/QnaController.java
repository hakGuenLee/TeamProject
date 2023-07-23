package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/* 
상품 Q&A 목록 가져오기
상품 Q&A 상세보기
상품 Q&A 답변 등록하기
 */

@Controller
@RequestMapping("/QnA")
public class QnaController {
	
	//상품 QnA 리스트 이동
	@GetMapping("/qnaList")
	public String qnaList() {
		
		return "/admin/qnaList";
	}
	
	//상품 QnA 리스트 이동
	@GetMapping("/qnaInfo")
	public String qnaInfo() {
			
	   return "/admin/qnaInfo";
	}

}
