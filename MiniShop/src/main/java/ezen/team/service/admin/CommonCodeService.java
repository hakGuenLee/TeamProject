package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;
import ezen.team.domain.ProductDTO;

public interface CommonCodeService {

	//공통코드 가져오기
	List<CommonCodeDTO> getCode(String code);

	//상품 카테고리 가져오기
	List<CategoryDTO> getProdCategory(String catCode);

	//팝업 이미지 가져오기
	List<PostDTO> getPopImg(String popNum);



}
