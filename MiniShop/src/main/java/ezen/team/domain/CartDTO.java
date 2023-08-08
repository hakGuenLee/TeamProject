package ezen.team.domain;

import java.sql.Date;

import lombok.Data;

//장바구니 도메인
@Data
public class CartDTO {

	private int cart_no; //카트 순번
	private String user_id; //회원 계정
	private String prod_no; //상품 번호
	private String op_code; //옵션코드
	private int qty; //수량
	private String buy_yn; //구매여부
	private Date cart_dt; //장바구니 담긴 일시
	private String prod_nm; //상품명
	private String main_img; //대표 이미지 파일명
	private int price; //가격
	private int point; //포인트
}
