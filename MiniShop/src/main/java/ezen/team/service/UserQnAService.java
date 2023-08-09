package ezen.team.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;

public interface UserQnAService {

	void QnaRegister(QnaDTO qnaDTO);

	List<QnaDTO> getQnaList(PageDTO pageDTO, HttpSession session);

	QnaDTO QnaInfo(String qna_no);

	int QnaCount(HttpSession session);

}
