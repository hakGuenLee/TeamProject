package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//상품
//prod_master 테이블
@Getter
@Setter
@ToString
public class ProductDTO {
	
	private int prod_no; //상품no
	private int ctgry_no; //카테고리ID
	private String prod_nm; //상품명
	private String main_img; //대표 이미지 파일명
	private String detail_img; // 상품 상세 이미지
	private String sub_img1; //서브이미지1
	private String sub_img2; //서브이미지2
	private int price; //가격
	private int point; //적립금
	private int qty; //수량
	private int dc_price; //할인가
	private String etc1; //기타1
	private String etc2; //기타2
	private String etc3; //기타3
	private String etc4; //기타4
	private String etc5; //기타5
	private String use_yn; //사용유무
	private String proc_id; //관리자ID(담당자)
	private Date proc_dt; //등록일
	private String mod_id; //관리자 ID(담당ㅈ)
	private Date mod_dt; //수정일
}
