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
	private String wrt_id; //관리자ID(등록자)
	private String aprv_id; //승인자ID(관리자)
	private Date strt_ymd; //게시 시작일
	private Date end_ymd; //게시 종료일
	private String file_nm; //이미지/에디터 파일명
	private Date proc_dt; //등록일
	private Date mod_dt; //수정일
	private String req_id; //승인요청자
	private Date req_dt; //승인요청일
	private Date aprv_dt; //승인 처리일

}
