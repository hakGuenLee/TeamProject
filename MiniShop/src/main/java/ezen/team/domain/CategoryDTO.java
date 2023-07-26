package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

//카테고리
//ctgry_mng 테이블

@Getter
@Setter
public class CategoryDTO {
	private int ctgry_no; //카테고리ID
	private String ct_cd1; //코드1(레벨1)
	private String ct_nm1; //코드명1
	private int ct_seq1; //순번1
	private String ct_cd2; //코드2(레벨2)
	private String ct_nm2; //코드명2
	private int ct_seq2; //순번2
	private String use_yn;//사용유무
	private String proc_id; //관리자ID(담당자)
	private Date proc_dt; //등록일

}
