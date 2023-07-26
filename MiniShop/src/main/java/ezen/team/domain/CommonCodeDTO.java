package ezen.team.domain;

import java.sql.Date;

import lombok.Data;

//공통코드 DTO
@Data
public class CommonCodeDTO {

	private int cm_no; //코드순번(기본키)
	private String cm_cd; //공통코드
	private String cm_nm; //공통코드명
	private String item_cd; //코드명
	private String item_nm; // 상세이름
	private String use_yn; //사용여부
	private String proc_id;
	private Date proc_dt; //등록일자
	
	
	
}
