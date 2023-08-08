package ezen.team.service;

import java.util.List;

import ezen.team.domain.BoardDTO;
import ezen.team.domain.CsDTO;

public interface BoardService {

	void csInsert(CsDTO csDto);

	//Notice 리스트 가져오기
	List<BoardDTO> getNoticeList();

	//해당번호에 맞는 공지 글 가져오기
	BoardDTO getNoticeContent(String no);

}
