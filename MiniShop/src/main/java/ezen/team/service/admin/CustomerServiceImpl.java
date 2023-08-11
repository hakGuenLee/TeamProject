package ezen.team.service.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;
import ezen.team.mapper.admin.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper mapper;

	//1:1문의건 리스트 가져오기
	@Override
	public List<CsDTO> csList(String cs_code, String proc_sts, PageDTO pageDto) {
		int totalCnt = mapper.totalCnt(pageDto);
		pageDto.setValue(totalCnt, pageDto.getCntPerPage());  
//		List<CsDTO> csList = mapper.csList(cs_code, proc_sts, pageDto);
//		System.out.println("서비스임플"+ csList);
		
		System.out.println(cs_code);
		return csList;

	}
	
	
	//회원 1:1문의건 상세보기
	public CsDTO csInfo(int cs_no, String proc_sts) {

		return mapper.csInfo(cs_no, proc_sts);
	}

	// 문의유형명 가져오기
	@Override
	public CsDTO itemName(String cs_code) {
		return mapper.itemName(cs_code);
	}

	@Override
	@Transactional
	public void csReply(int cs_no, String csre_con, String proc_id, String proc_sts, String prev_sts) {
		
		if(!prev_sts.equals("1"))
			mapper.modifyReply(cs_no, csre_con);
		else
			mapper.csReply(cs_no, csre_con, proc_id);		
		mapper.stsUpdate(cs_no, proc_sts);
		
	}	



}
