package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;

public interface QnaService {

	// 상품문의 리스트 가져오기
	List<QnaDTO> qnaList(PageDTO pagedto);

}
