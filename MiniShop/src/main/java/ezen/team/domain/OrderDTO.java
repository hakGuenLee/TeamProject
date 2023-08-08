package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

//주문/배송목록

@Getter
@Setter
public class OrderDTO {
	


	
	//order_master
	private String order_no; //주문번호
	private String user_id; //회원 아이디
	private int od_seq; // 주문seq
	private int tot_qty; //총 주문수량
	private Date order_dt; //주문일자
	private int addr_no;// 배송지번호
	private String order_sts; //주문 상태
	
	//order_detail
	private int od_no; //no primary key
	private String prod_no; //상품번호
	private String op_code; //옵션코드
	private String point; //포인트
	private Date buy_dt; //구매일자
	private String payback_yn; //환불여부

	private String cs_yn; //취소여부
	
	
	


}
