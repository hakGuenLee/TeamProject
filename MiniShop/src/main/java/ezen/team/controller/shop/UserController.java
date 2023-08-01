package ezen.team.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
로그인
로그아웃
마이페이지 이동
마이페이지_찜리스트
마이페이지_적립금
마이페이지_1:!문의내역
마이페이지_주문/배송조회
마이페이지_제품문의내역
마이페이지_회원탈퇴
마이페이지_회원정보 수정
 */


@Controller
@RequestMapping("/user")
public class UserController {
	
	//로그인 페이지 이동
	@GetMapping("/userLogin")
	public String userLogin() {
		
		
		return "/user/userLogin";
	}
	
	
	// 아이디 비밀번호 찾기 이동
	@GetMapping("/idpwSearch") // id찾기인지 pw찾기인지 param으로 가져오기
	public String idSearch(@RequestParam("find")String find,Model model) {
		
		model.addAttribute("find",find);
		// 가져와서 보내 준 후 if문으로 active 시켜줘서 display 띄워주기
		
		return "/user/idpwSearch";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/userRegister")
	public String userRegister() {
		
		return "/user/userRegister";
	}
	
	
	// //////////// 마이페이지 /////////////////////

	@GetMapping("/myInfoUpdate")
	public String myInfoUpdate() {
		
		return"/user/myInfoUpdate";
	}
	
	@GetMapping("/myPagehome")
	public String myPagehome() {
		
		return "/user/myPagehome";
	}
	
	@GetMapping("/myPagePoint")
	public String myPagePoint() {
		
		return "/user/myPagePoint";
	}
	@GetMapping("/myPageProdQna")
	public String myPageProdQna() {
		
		return "/user/myPageProdQna";
	}
	@GetMapping("/myPageQuestion")
	public String myPageQuestion() {
		
		return "/user/myPageQuestion";
	}
	@GetMapping("/myPageWish")
	public String myPageWish() {
		
		return "/user/myPageWish";
	}
	
	// //////////// 마이페이지 /////////////////////

}
