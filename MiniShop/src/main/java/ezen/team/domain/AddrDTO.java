package ezen.team.domain;

import java.sql.Date;

import lombok.Data;

//배송지 DTO
@Data
public class AddrDTO {
	
	private int addr_no;
	private String user_id; //회원 아이디
	private String addr_nm; //받는 사람 이름
	private String addr_gb; //기본배송지 여부
	private String addr_nik; //배송지 별칭
	private String addr_tel; //휴대번호
	private String zipcode; //우편번호
	private String addr; //기본 주소
	private String addr_detail; //상세주소
	private Date addr_dt; //등록일자
	private String addr_jibun; //지번주소
}
