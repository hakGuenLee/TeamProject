package ezen.team.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
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
	
	//상품 문의 이동
	@GetMapping("/prodQuestion")
	public String prodQuestion(@RequestParam("name") String prodName,
								@RequestParam("no") String prodNo,
								Model model) {
		
		model.addAttribute("prodName", prodName);
		model.addAttribute("prod_no", prodNo);
		
		return "/user/prodQuestion";
	}
	
	
	
	
	// 나의 상품문의 내역 페이지 이동
	@GetMapping("/myPageProdQna")
	public String myPageProdQna(PageDTO pageDTO, Model model,HttpServletRequest rq) {
		
		HttpSession session = rq.getSession();
		
		// 상품문의 개수 구하기
		int QnaCount = userQnAService.QnaCount(session);
		List<QnaDTO> list = userQnAService.getQnaList(pageDTO, session);
		
		model.addAttribute("list",list);
		model.addAttribute("QnaCount",QnaCount);
		
		return "/user/myPageProdQna";
	}
	
	
	// 상품문의 등록하기
	@PostMapping("QnaRegister")
	public String QnaRegister(QnaDTO qnaDTO, HttpServletRequest rq, Model model) {

		userQnAService.QnaRegister(qnaDTO);
		// 이전페이지 주소
//		String referer = (String)rq.getHeader("REFERER");
		
		return "redirect:/userQna/myPageProdQna";
	}
	
	// 상품문의 상세보기
	@GetMapping("QnaInfo")
	public String QnaInfo(@RequestParam("qna_no")String qna_no
							,Model model) {
		
		QnaDTO qnaDTO = userQnAService.QnaInfo(qna_no);
		model.addAttribute("qnaDTO",qnaDTO);
		
		return "/user/prodQnaInfo";
	}
	
	// 상품문의 기간별 조회하기
	@PostMapping("/dateSearch")
	public String dateSearch(@RequestParam("stt_ymd")String stt_ymd,
							@RequestParam("end_ymd")String end_ymd,
							PageDTO pageDTO,
							HttpSession session,
							Model model) {
		
		
		
		List<QnaDTO> list =  userQnAService.dateSearch(pageDTO, session, stt_ymd, end_ymd);
		
		model.addAttribute("list",list);
		
		return "/user/myPageProdQna";
	}
	
	
	
	
}
