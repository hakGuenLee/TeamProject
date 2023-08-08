package ezen.team.mapper;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.QnaDTO;

//ShopServiceImpl과 연결

@Mapper
public interface UserQnAMapper {

	void QnaRegister(QnaDTO qnaDTO);

}
