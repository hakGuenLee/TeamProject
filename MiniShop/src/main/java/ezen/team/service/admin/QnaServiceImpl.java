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
	public List<QnaDTO> qnaList(PageDTO pagedto) {
		
		int totalCnt = mapper.totalCnt(pagedto);
		
		pagedto.setValue(totalCnt, pagedto.getCntPerPage());    
		
		List<QnaDTO> QList = mapper.qnaList(pagedto);
		
		System.out.println("서비스임플"+ QList);
		
		return QList;
	}

}
