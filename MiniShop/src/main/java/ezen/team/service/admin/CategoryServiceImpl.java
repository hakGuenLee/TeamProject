package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.PageDTO;
import ezen.team.mapper.admin.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper mapper;
	
	//카테고리 리스트 가져오기(페이지 네이션 적용)
	 @Override
	 public List<CategoryDTO> catList(PageDTO pagedto) {
	      
		int totalCnt = mapper.totalCnt(pagedto);
			
		pagedto.setValue(totalCnt, pagedto.getCntPerPage());    	      
	    
		return mapper.catList(pagedto);
	   }
	   
	//카테고리 등록
	@Override
	public void catRegister(CategoryDTO cdto) {
		
		 mapper.catRegister(cdto);		
	}

	//카테고리 수정 시 id값 가져오기
	@Override
	public CategoryDTO catListByNo(String no) {
		
		return mapper.catListByNo(no);
	}

	//카테고리 수정
	@Override
	public void catUpdate(CategoryDTO cdto) {
		
		mapper.catUpdate(cdto);		
	}
	
	//카테고리 리스트 가져오기
	@Override
	public List<CategoryDTO> cateList() {

		return mapper.cateList();
	}

	//카테고리 삭제
	@Override
	public void deleteCategory(String no) {
		
		mapper.deleteCategory(no);		
	}

	//카테고리명 검색
	@Override
	public List<CategoryDTO> catNameSearch(String search) {

		return mapper.catNameSearch(search);
	}


}
