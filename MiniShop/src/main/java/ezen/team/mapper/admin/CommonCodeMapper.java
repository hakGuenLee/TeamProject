package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;
import ezen.team.domain.ProductDTO;

@Mapper
public interface CommonCodeMapper {

	//공통코드 가져오기
	List<CommonCodeDTO> getCode(String code);

	//상품 카테고리 가져오기
	List<CategoryDTO> getProdCategory(String catCode);

	//팝업 이미지 가져오기
	List<PostDTO> getPopImg(String popNum);



}
