package ezen.team.service.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;
import ezen.team.mapper.admin.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper mapper;

	@Override
	public List<CsDTO> csList(String cs_code, String proc_sts) {
		System.out.println(cs_code);
		return mapper.csList(cs_code, proc_sts);
	}
	
	@Override
	public CsDTO csInfo(int cs_no, int proc_sts) {
		System.out.println(cs_no);
		return mapper.csInfo(cs_no, proc_sts);
	}

	@Override
	public CsDTO itemName(String cs_code) {
		return mapper.itemName(cs_code);
	}

	@Override
	public void csReply(int cs_no, String csre_con, String proc_id) {
		mapper.csReply(cs_no, csre_con, proc_id);
	}


	
	



}
