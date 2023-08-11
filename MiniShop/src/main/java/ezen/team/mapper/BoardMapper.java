package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.BoardDTO;
import ezen.team.domain.CsDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;

//BoardServiceImple과 연결

@Mapper
public interface BoardMapper {

	public void csInsert(CsDTO csDto);

	//notice 모두 가져오기
	public List<BoardDTO> getNoticeList(PageDTO pageDto);
	
	//해당번호에 맞는 공지 글 가져오기
	public BoardDTO getNoticeInfo(String no);

	public CsDTO csInfo(String cs_no);

	//Notice 총 개수 구하기
	public int getNoticeTotalCnt(PageDTO pageDto);

	//해당번호의 공지글 1 추가
	public void addNoticeHit(String no);

	public int getCount(String user_id, String stt_ymd, String end_ymd);
	// 1:1문의 기간별 조회하기
	public List<CsDTO> dateSearch(PageDTO pageDTO, String user_id, String stt_ymd, String end_ymd);

	//공지글 검색하기
	public List<BoardDTO> searchNotice(String search);

}
