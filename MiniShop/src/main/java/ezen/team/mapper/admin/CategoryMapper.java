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
	  int  totalCnt(PageDTO pagedto);

	int catRegister(CategoryDTO cdto);

	CategoryDTO catListByNo(String no);

	void catUpdate(CategoryDTO cdto);
	
	

}
