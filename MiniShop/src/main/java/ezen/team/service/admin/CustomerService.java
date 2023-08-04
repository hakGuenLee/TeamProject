package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;

public interface CustomerService {

	List<CsDTO> csList(String cs_code, String proc_sts, PageDTO pageDto);
	
	CsDTO csInfo(int cs_no, int proc_sts);

	CsDTO itemName(String cs_code);

	void csReply(int cs_no, String csre_con, String proc_id);

	

}
