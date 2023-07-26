package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CategoryDTO;

//CategoryServiceImpl과 연결

@Mapper
public interface CategoryMapper {
	
	  List<CategoryDTO> catList();

	int catRegister(CategoryDTO cdto);

	CategoryDTO catListByNo(String no);

	void catUpdate(CategoryDTO cdto);
	
	

}
