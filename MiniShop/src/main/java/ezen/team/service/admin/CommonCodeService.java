package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;

public interface CommonCodeService {

	//공통코드 가져오기
	List<CommonCodeDTO> getCode(String code);

	//카테고리 리스트 가져오기
	List<CategoryDTO> getCategory(String category);

	//팝업 이미지 파일명 가져오기
	String getPop(String postno);

}
