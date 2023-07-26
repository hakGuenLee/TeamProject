package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CategoryDTO;



public interface CategoryService {

	//카테고리 리스트 가져오기
	List<CategoryDTO> catList();

	//카테고리 등록
	void catRegister(CategoryDTO cdto);

	//카테고리 수정 시 id값 가져오기
	CategoryDTO catListByNo(String no);

	//카테고리 수정
	void catUpdate(CategoryDTO cdto);
	
}
