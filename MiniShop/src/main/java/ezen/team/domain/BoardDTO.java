package ezen.team.domain;

import java.sql.Date;

import lombok.Data;

//게시판 DTO
@Data
public class BoardDTO {

	private int pst_no; //순번
	private String pst_gb; //공지, 팝업 구분
	private String pst_ttl; //제목
	private String wrt_id; //작성자 아이디
	private String aprv_id; //권한
	private Date strt_ymd; //시작일자
	private Date end_ymd; //종료일자
	private String pst_img; //팝업 이미지
	private String pst_txt; //게시글 내용
	private String pst_sts; //처리상태 
	private Date proc_dt; //등록일자
	private Date mod_dt; //처리일자
	private String req_id; //요청자(공지 혹은 팝업을 등록한 사람)ㅒ
	private Date req_dt; //승인 요청일자
}
