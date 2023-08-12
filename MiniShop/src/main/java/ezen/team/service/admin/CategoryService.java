package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.PageDTO;



public interface CategoryService {

	//카테고리 리스트 가져오기 ( 페이징 처리 )
	List<CategoryDTO> catList(PageDTO pagedto);
	
	//카테고리 리스트 가져오기
	List<CategoryDTO> cateList();

	//카테고리 등록
	void catRegister(CategoryDTO cdto);

	//카테고리 수정 시 id값 가져오기
	CategoryDTO catListByNo(String no);

	//카테고리 수정
	void catUpdate(CategoryDTO cdto);

	//카테고리 삭제
	void deleteCategory(String no);

	//카테고리명 검색하기
	List<CategoryDTO> catNameSearch(String search);
	
}
