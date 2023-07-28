package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CsDTO;
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

}
