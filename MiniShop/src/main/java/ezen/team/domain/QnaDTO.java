package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


// 상품 문의 관련 DTO
@Getter
@Setter
public class QnaDTO {

	
	private int qna_no;
	private String user_id;
	private String prod_no;
	private String prod_nm;
	private String qna_code;
	private String qna_pw;
	private Date qna_dt; 
	private String qna_ttl;
	private String qna_con;
	private String proc_id;
	private String proc_sts;
	private Date proc_dt;
	private int cs_code;
	
	
}
