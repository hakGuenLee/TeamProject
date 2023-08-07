package ezen.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CsDTO;
import ezen.team.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;

	@Override
		public void csInsert(CsDTO csDto) {
		mapper.csInsert(csDto);
		
	}

}
