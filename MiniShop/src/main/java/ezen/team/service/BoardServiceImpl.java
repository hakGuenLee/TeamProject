package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.BoardDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.UserInfoHandler;
import ezen.team.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;


	@Autowired
	private UserInfoHandler userInfoHandler;
	

	
	@Override
		public void csInsert(CsDTO csDto) {
		mapper.csInsert(csDto);		
	}

	//Notice 모두 가져오기
	@Override
	public List<BoardDTO> getNoticeList(PageDTO pageDto) {
		
		//게시글 총 개수 구하기
		int totalCnt = mapper.getNoticeTotalCnt(pageDto);
		pageDto.setValue(totalCnt, pageDto.getCntPerPage());
		
		return mapper.getNoticeList(pageDto);
	}

	//해당번호에 맞는 공지 글 가져오기 (notice 상세보기)
	@Override
	public BoardDTO getNoticeContent(String no) {
		
		//해당 번호의 공지 글 조회수 1 추가
		mapper.addNoticeHit(no);
		
		//해당 번호의 공지글 가져오기
		return mapper.getNoticeInfo(no);
	}

	//1:1 문의 내용 상세보기
	@Override
	public CsDTO csInfo(String cs_no) {
		
		return mapper.csInfo(cs_no);
	}

	// 1:1	// 기간별로 조회하기
	@Override
	public List<CsDTO> dateSearch(PageDTO pageDTO, HttpSession session, String stt_ymd, String end_ymd) {
		
		String user_id = userInfoHandler.getUserId(session);		
		
		int totalCnt = mapper.getCount(user_id, stt_ymd, end_ymd);
		pageDTO.setCntPerPage(5);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		
		return mapper.dateSearch(pageDTO, user_id, stt_ymd, end_ymd);
		
	}
	
	
}
