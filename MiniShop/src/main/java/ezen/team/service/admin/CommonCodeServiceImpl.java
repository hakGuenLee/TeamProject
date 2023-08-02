package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;
import ezen.team.mapper.admin.CommonCodeMapper;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	CommonCodeMapper mapper;
	
	
	//공통코드 가져오기
	@Override
	public List<CommonCodeDTO> getCode(String code) {
		
		List<CommonCodeDTO> list = mapper.getCode(code);
		
		return list;
	}

	//카테고리 리스트 가져오기
	@Override
	public List<CategoryDTO> getCategory(String category) {
		
		List<CategoryDTO> list = mapper.getCategory(category);
		return list;
	}

	//팝업 이미지 가져오기
	@Override
	public String getPop(String postno) {
		
		String popImg = mapper.getPopImg(postno);
		
		return popImg;
	}

}
