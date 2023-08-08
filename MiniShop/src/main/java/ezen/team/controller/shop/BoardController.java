package ezen.team.controller.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.team.domain.BoardDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.UserDTO;
import ezen.team.service.BoardService;

/*
공지사항
FAQ
1:1문의하기
상품문의하기
 */

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	//Notice 페이지 이동(게시글)
	@GetMapping("/noticePage")
	public String notice(Model model) {
		
		List<BoardDTO> list = service.getNoticeList();
		
		model.addAttribute("list", list);
		
		return "/user/notice";
	}
	
	//Notice 상세보기
	@GetMapping("/noticeView")
	public String noticeView(@RequestParam("no")String no, Model model) {
		
		BoardDTO bDto = service.getNoticeContent(no);
		
		model.addAttribute("board", bDto);
		
		return "/user/noticeInfo";
		
	}
	
	
	
	//1:1문의 이동
	@GetMapping("/question")
	public String question(CsDTO csDto, HttpSession session, Model model) {
		UserDTO user =	(UserDTO) session.getAttribute("userDTO");
		String id = user.getUser_id();
		
		model.addAttribute("user_id", id);
		
		return "/user/csInsert";
	}
	
	//1:1문의 등록하기
	@PostMapping("/question")
	public String question(CsDTO csDto) {
		
		// 주문 상품 가져오기
//		service.searchProd(session.get);
		System.out.println("1:1문의 파라미터 : " + csDto);
		// 1:1문의 등록하기
		service.csInsert(csDto);
		
		return "/user/csInfo";
	}
	
	//상품 문의 이동
	@GetMapping("/prodQuestion")
	public String prodQuestion() {
		
		return "/user/prodQuestion";
	}
	

	
	
}
