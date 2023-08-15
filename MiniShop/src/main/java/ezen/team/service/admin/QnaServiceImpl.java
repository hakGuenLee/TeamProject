package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;
import ezen.team.mapper.admin.QnaMapper;

//QnaController와 연결

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaMapper mapper;
	
	// 상품문의 리스트 가져오기
	@Override
	public List<QnaDTO> qnaList(String cs_code, String proc_sts, PageDTO pagedto) {

		int totalCnt = mapper.totalCnt(pagedto);
		
		pagedto.setValue(totalCnt, pagedto.getCntPerPage());
		
		
		return mapper.qnaList(cs_code, proc_sts,pagedto);
	}

}
