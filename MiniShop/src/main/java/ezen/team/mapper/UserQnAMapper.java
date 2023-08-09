package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;

//ShopServiceImpl과 연결

@Mapper
public interface UserQnAMapper {

	void QnaRegister(QnaDTO qnaDTO);

	List<QnaDTO> getQnaList(PageDTO pageDTO, String user_id);

	QnaDTO QnaInfo(String qna_no);

	// 페이징처리를 위한 totalcnt 용도 하나
	int QnaCount(String user_id);


}
