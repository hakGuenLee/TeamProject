package ezen.team.mapper.admin;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
/*import org.springframework.security.core.userdetails.UserDetails;*/

import ezen.team.domain.AdminDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.EmpDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.UserDTO;

//AdminServiceImpl과 연결

@Mapper
public interface AdminMapper {

	
	//관리자 등록
	void adminRegister(AdminDTO aDto);

	//사번 검색
	EmpDTO getEmp(String name);

	//관리자 리스트 가져오기
	List<AdminDTO> getAdminList();

	//관리자 삭제
	void adminDelete(String id);

	//수정할 관리자 정보 가져오기
	AdminDTO getAdminInfo(String id);

	//관리자 정보 수정하기
	void adminUpdate( AdminDTO aDto);

	//관리자 로그인 정보 가져오기
	AdminDTO findByusername(String username);

	//관리자 등록 아이디 유효성 검사
	AdminDTO adminIdCheck(String id);

	//회원 리스트 가져오기
	List<UserDTO> getUserList(PageDTO pageDto);




}
