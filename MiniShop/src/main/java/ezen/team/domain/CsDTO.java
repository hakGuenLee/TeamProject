package ezen.team.domain;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

// 1:1문의
// cs_master 테이블

@Data
public class CsDTO {
	private int cs_no; 		 // 1:1문의 번호
	private String user_id;  // 회원 ID
	private String prod_no;  // 상품 ID
	private String cs_code;  // 문의유형코드
	private String item_nm;  // 문의유형명
	private String cs_ttl; // 제목
	private Date cs_dt; 	 // 문의일시
	private String cs_con; 	 // 내용
	private String proc_sts; // 처리상태
	private Date sts_dt;	 // 상태일자
	
// cs_reply 테이블
	private int csre_no;	 // 1:1문의답변 번호
	private String csre_con; // 답변내용
	private String proc_id;  // 처리자
	private Date proc_dt;  	 // 처리일시
	
}









