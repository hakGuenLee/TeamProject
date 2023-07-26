package ezen.team.domain;

import lombok.Data;

//임직원 정보 (emp_info 테이블과 관련)

@Data
public class EmpDTO {
	private String emp_id; //사번
	private String emp_nm; //이름
	private String empgrd; //직급
	private String emprole; //직책
	private String deptcd; //부서코드
	private String deptnm; //부서명
	private String cellphone; //휴대폰번호
	private String offtel; //사무실번호
	private String email; //이메일

	
	
	
	
	
	

}
