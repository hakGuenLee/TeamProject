package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {


	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_nm;
	private String user_home;
	private String user_phone;
	private String user_email;
	private Date birth_ymd;
	private String zipcode;
	private String addr;
	private String addr_road;
	private String addr_detail;
	private String use_yn;
	private Date user_dt;



	
	
}
