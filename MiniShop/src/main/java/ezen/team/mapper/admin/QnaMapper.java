package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;

@Mapper
public interface QnaMapper {

	// 상품문의 페이징 처리
	int totalCnt(PageDTO pagedto);
	//상품문의 가져오기
	List<QnaDTO> qnaList(PageDTO pagedto);

}
