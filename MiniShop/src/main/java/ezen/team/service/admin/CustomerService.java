package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CsDTO;

public interface CustomerService {

	List<CsDTO> csList(String cs_code, String proc_sts);

}
