package ezen.team.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/* 
공지사항 등록
팝업 등록
승인 요청하기
 */

@Controller
@RequestMapping("/notice")
public class NoticeController {


	@GetMapping("/noticeRegister")
	public String noticeRegister() {
		
		return "admin/noticeRegister";
	}
	
}
