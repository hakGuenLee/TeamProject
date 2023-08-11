package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.PageDTO;

//CategoryServiceImpl과 연결

@Mapper
public interface CategoryMapper {
	
	List<CategoryDTO> cateList();
	
	List<CategoryDTO> catList(PageDTO pagedto);
	
	//카테고리 총 개수 구하기  
	int  totalCnt(PageDTO pagedto);

	 //카테고리 등록
	int catRegister(CategoryDTO cdto);

	//카테고리 수정 시 id 값 가져오기
	CategoryDTO catListByNo(String no);

	//카테고리 업데이트
	void catUpdate(CategoryDTO cdto);
	
	//카테고리 삭제
	void deleteCategory(String no);
	
	

}
