package ezen.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.BoardDTO;
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

	//Notice 모두 가져오기
	@Override
	public List<BoardDTO> getNoticeList() {
		return mapper.getNoticeList();
	}

	//해당번호에 맞는 공지 글 가져오기
	@Override
	public BoardDTO getNoticeContent(String no) {
		
		return mapper.getNoticeInfo(no);
	}

}
