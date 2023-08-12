package ezen.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.team.domain.AdminDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.EmpDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.UserDTO;
import ezen.team.service.admin.AdminService;
import ezen.team.service.admin.AdminServiceImpl;

/* 
관리자 페이지 이동
관리자 등록페이지 이동
관리자 등록 처리
관리자 로그 확인하기
승인 요청 목록 조회
승인 처리하기 
관리자 리스트 
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	

	
	//관리자 등록 페이지 이동
	@GetMapping("/adminRegister")
	public String adminRegister(Model model) {
			
		return "/admin/adminRegister";
	}
	
	//관리자 등록 시 ID 유효성 체크
	@PostMapping("/adminIdChk")
	@ResponseBody
	public String adminIdChk(@RequestParam("adm_id")String id) {
		
		AdminDTO adminDTO = adminservice.adminIdChk(id);
		if(adminDTO != null || "".equals(id.trim())) {
			return "N";
		}
		return "yes";		
	}
	
	//관리자 등록 시 닉네임 유효성 체크
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public String nickNameCheck(@RequestParam("vnm") String vnm) {
		
		System.out.println("vnm : " + vnm);
		
		int nickNameNum = adminservice.nickNameCheck(vnm);
		
		System.out.println("개수 : " + nickNameNum);
		
		if(nickNameNum == 1) {
			return "No";
		}
		
		return "Yes";

	}
		
	//관리자 등록 처리
	@PostMapping("/adminRegister")
	public String adminRegister(AdminDTO aDto) {
	
		adminservice.adminRegister(aDto);
			
		return "redirect:/admin/adminList";		
	}
		
	//관리자 사번 검색
	@PostMapping("/empSearch")
	@ResponseBody
	public String empSearch(@RequestParam("name") String name) {
		
		String empId = adminservice.getEmpList(name);		
		
		if(empId == null) {
			return "NotFound";
		}	
		return empId;
	}
	
	//승인 요청 목록 페이지 이동(조회)
	@GetMapping("/requestList")
	public String requestList() {
		
		return "/admin/requestList";
	}
		
	//관리자 리스트 페이지 이동
	@GetMapping("/adminList")
	public String adminList(Model model, PageDTO pageDto) {
			
		List<AdminDTO> list = adminservice.getAdminList(pageDto);
	
		model.addAttribute("adminList", list);
		
		return "/admin/adminList";
	}
	
	
	//관리자 수정 페이지 이동
	@GetMapping("/adminUpdate")
	public String adminUpdate(@RequestParam("id") String id, Model model) {
		
		AdminDTO adminDto = adminservice.getAdminInfo(id);
		
		model.addAttribute("adminDTO", adminDto);
		
		return "/admin/adminUpdate";
	}
	
	//관리자 수정 처리
	@PostMapping("/adminUpdate")
	public String adminUpdateComplete(AdminDTO aDto) {
		
		adminservice.adminUpdate(aDto);		
		
		return "redirect:/admin/adminList";
	}
	
	
	//관리자 삭제
	@GetMapping("/adminDelete")
	public String adminDelete(@RequestParam("id") String id) {
		
		 adminservice.adminDelete(id);
		
		return "redirect:/adminList";
	}
	
	//회원리스트 페이지 이동
	@GetMapping("/userList")
	public String userList(Model model, PageDTO pageDto) {
		
		List<UserDTO> userList = adminservice.getUserList(pageDto);
		
		model.addAttribute("list", userList);				
		return "/admin/userList";
	}
	
	//회원정보 상세보기 이동
	@GetMapping("/userInfoUpdate")
	public String userUpdate(String no, Model model) {
		System.out.println("넘어온 회원 번호 : " + no);
		
		UserDTO userInfo = adminservice.getUserInfo(no);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/admin/userInfo";
	}
	
	//회원정보 수정 처리
	@PostMapping("/userInfoUpdate")
	public String userUpdate(UserDTO uDto) {
		
		adminservice.updateUserInfo(uDto);
		
		return "redirect:/admin/userList";
		
	}
	
	//회원검색하기
	@PostMapping("/userSearch")
	public String userSearch(String search, Model model) {
		
		List<UserDTO> list = adminservice.searchUser(search);
		
		model.addAttribute("list", list);
		
		return "/admin/userList";
		
	}
	
	
}
