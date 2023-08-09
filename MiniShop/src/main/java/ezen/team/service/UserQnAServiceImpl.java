package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;
import ezen.team.domain.UserDTO;
import ezen.team.mapper.UserQnAMapper;

@Service
public class UserQnAServiceImpl implements UserQnAService {

	@Autowired
	private UserQnAMapper mapper;

	// 상품문의 등록하기
	@Override
	public void QnaRegister(QnaDTO qnaDTO) {
		mapper.QnaRegister(qnaDTO);

	}

	// 상품문의 리스트 가져오기
	@Override
	public List<QnaDTO> getQnaList(PageDTO pageDTO, HttpSession session) {

		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		String user_id = user.getUser_id();

		
		// 페이징네이션처리를 위한 pageDTO
		int totalCnt = mapper.QnaCount(user_id);
		pageDTO.setCntPerPage(5); // 5건씩 보이게 세팅
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		

		return mapper.getQnaList(pageDTO, user_id);
	}

	// 상품문의 상세보기
	@Override
	public QnaDTO QnaInfo(String qna_no) {
		return mapper.QnaInfo(qna_no);
	}

	// 상품문의 개수 구하기
	@Override
	public int QnaCount(HttpSession session) {

		UserDTO user = (UserDTO) session.getAttribute("userDTO");

		String user_id = user.getUser_id();

		return mapper.QnaCount(user_id);
	}

}
