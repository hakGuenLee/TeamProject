package ezen.team.domain;

import lombok.Data;

//위시리스트 DTO

@Data
public class WishDTO {
	
	private int wish_no; //위시리스트 순번
	private String user_id; //회원 아이디
	private String prod_no; //상품 번호
	private String main_img; //상품 대표 이미지
	private String prod_nm;
	private String price;
	private String point;
	
}
