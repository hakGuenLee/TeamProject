package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;

public interface CustomerService {

	List<CsDTO> csList(String cs_code, String proc_sts);

	CsDTO csInfo(int cs_no);

	CsDTO itemName(String cs_code);

}
