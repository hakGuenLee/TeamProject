package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostDTO {
	//게시글(공지사항/팝업) DTO
	//post_mng 테이블
	
	
	private int pst_no; //게시ID
	private String pst_gb; //등록구분
	private String pst_ttl; //제목
	private String wrt_id; //관리자ID(등록자)
	private String aprv_id; //승인자ID(관리자)
	private Date strt_ymd; //게시 시작일
	private Date end_ymd; //게시 종료일
	private String pst_img; // 팝업 등록 이미지
	private String pst_txt; // 공지 등록 게시글 
	private String pst_sts; // 승인 상태
	private Date proc_dt; //등록일
	private Date mod_dt; //수정일
	private String req_id; //승인요청자
	private Date req_dt; //승인요청일
	private Date aprv_dt; //승인 처리일

}
