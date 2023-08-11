package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//주문/배송목록/교환/환불조회

@Getter
@Setter
@ToString
public class UserOrderDTO {
	
	private String user_id;  // 유조 id
	private String user_phone; // 유저 폰번호
	
	private String user_nm; //유저이름
	private String search; // 검색결과
	
	
	private String order_no;  // 주문번호
	private String prod_nm; // 상품 이름
	private String main_img; // 상품 메인 이미지
	private int price; // 상품 가격
	private int point; // 상품 적립금
	private Date order_dt; // 주문일자
	
	private String addr_tel; //배송지 번호
	private String zipcode; // 우편 번호
	private String addr; // 기본주소
	private String addr_detail; // 상세주소
	
	private String order_sts; // 주문상태
	
	

}
