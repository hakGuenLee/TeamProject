package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

//주문/배송목록

@Getter
@Setter
public class OrderDTO {
	
	//공통
	private Long order_no; //주문번호
	private String user_id; //회원 계정
	private int addr_no; // 배송지 번호
	private int od_seq; // 주문 순번

	private Date buy_dt;
	
	// 주문 마스터
	private Date order_dt; //주문일자
	private String order_sts; // 주문 상태
	private int tot_qty; // 총 주문수량
	
	
	// 주문 디테일
	private int od_no; // 주문디테일 번호
	private String prod_no; // 상품번호
	private int op_code; // 옵션코드
	private int price; // 상품 가격
	private int qty; // 상품수량
	private int point; // 상품 적립금
	private int tot_price; // 상품 총 금액
	private String payback_yn;// 환불여부
	private String cs_yn; //취소여부
	
	
	
	
	
	
	

}
