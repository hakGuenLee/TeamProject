package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

//주문/배송목록

@Getter
@Setter
public class OrderDTO {
	
	private int order_no; //카트 순번
	private String user_id; //회원 계정
	private String prod_no; //상품 번호
	private String op_code; //옵션코드
	private int qty; //수량
	private String prod_nm; //상품명
	private String main_img; //대표 이미지 파일명
	private int price; //가격

}
