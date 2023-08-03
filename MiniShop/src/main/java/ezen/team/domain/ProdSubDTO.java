package ezen.team.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProdSubDTO {

	
	private int img_no;
	private String prod_no;
	private String detail_img;
	private String sub_img1;
	private String sub_img2;
	private String proc_id;
	private Date proc_dt;

}
