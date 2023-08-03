package ezen.team.domain;



import java.sql.Date;

import lombok.Data;

//관리자
//admin_master 테이블
@Data
public class AdminDTO  {
	

	private String adm_id; //관리자ID
	private String adm_vnm; //관리자명(별칭)
	private String adm_nm; //관리자명(실명)
	private String adm_pw; //비밀번호
	private String emp_id; //관리자 사번
	private String use_yn; //사용구분
	private Date proc_dt; //등록일
	private Date mod_dt; //수정일
	private Date exp_dt; //종료일
	private String proc_id; //등록처리자
	private String mod_id; //수정처리자
	private String exp_id; //종료처리자
	private String role; //권한


	

	
	
	


}
