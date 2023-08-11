package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ezen.team.domain.OrderDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;

public interface UserQnAService {

	void QnaRegister(QnaDTO qnaDTO);

	List<QnaDTO> getQnaList(PageDTO pageDTO, HttpSession session);

	QnaDTO QnaInfo(String qna_no);

	int QnaCount(HttpSession session);

	List<QnaDTO> dateSearch(PageDTO pageDTO, HttpSession session, String stt_ymd, String end_ymd);

}
