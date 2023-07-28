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
	
	//카테고리 리스트 가져오기
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
		
		CategoryDTO cdto = mapper.catListByNo(no);
		
		return cdto;
	}

	//카테고리 수정
	@Override
	public void catUpdate(CategoryDTO cdto) {
		
		mapper.catUpdate(cdto);
		
	}




	@Override
	public List<CategoryDTO> cateList() {
		List<CategoryDTO> cList = mapper.cateList();
		return cList;
	}


}
