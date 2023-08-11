package ezen.team.service.admin;


import java.util.List;

import ezen.team.domain.AdminDTO;
import ezen.team.domain.EmpDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.UserDTO;

public interface AdminService {
	
	//관리자 등록
	void adminRegister(AdminDTO aDto);
	
	//사번 검색
	String getEmpList(String name);

	//관리자 리스트 가져오기
	 List<AdminDTO> getAdminList();
	 
	 //관리자 삭제
	 void adminDelete(String id);
	 
	 //수정할 관리자 정보 가져오기
	 AdminDTO getAdminInfo(String id);
	 
	//관리자 정보 수정 처리하기
	 void adminUpdate(AdminDTO aDto);
	 
	 //관리자 등록 아이디 유효성 검사
	 AdminDTO adminIdChk(String id);
	 
	 //관리자 등록 시 닉네임 유효성 검사
		int nickNameCheck(String vnm);
	 
	 //회원 리스트 가져오기
	 List<UserDTO> getUserList(PageDTO pageDto);

	

}
