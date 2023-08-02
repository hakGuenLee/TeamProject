package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;

@Mapper
public interface CommonCodeMapper {

	//공통코드 가져오기
	List<CommonCodeDTO> getCode(String code);

	//카테고리 리스트 가져오기
	List<CategoryDTO> getCategory(String category);

	//팝업 이미지 가져오기
	String getPopImg(String postno);

}
