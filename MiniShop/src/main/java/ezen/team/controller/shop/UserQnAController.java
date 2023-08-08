package ezen.team.controller.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.team.domain.QnaDTO;
import ezen.team.service.UserQnAService;

/*
찜리스트 저장
상품별 페이지 이동
상품 상세 페이지 처리
상품 리뷰 등록처리
상품 문의하기
상품 검색
 */

@Controller
@RequestMapping("/userQna")
public class UserQnAController {

	@Autowired
	private UserQnAService userQnAService;
	
	
	@PostMapping("QnaRegister")
	public String QnaRegister(QnaDTO qnaDTO, HttpServletRequest rq) {
		
		userQnAService.QnaRegister(qnaDTO);
		
		// 이전페이지 주소
		String referer = (String)rq.getHeader("REFERER");
		
		return "redirect:/";
		
	}
	
	
	
}
