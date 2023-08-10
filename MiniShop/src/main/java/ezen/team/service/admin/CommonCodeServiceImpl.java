package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.PostDTO;
import ezen.team.domain.ProductDTO;
import ezen.team.mapper.admin.CommonCodeMapper;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	CommonCodeMapper mapper;
	
	
	//공통코드 가져오기
	@Override
	public List<CommonCodeDTO> getCode(String code) {
		
		return mapper.getCode(code);
	}

	//상품 카테고리 가져오기
	@Override
	public List<CategoryDTO> getProdCategory(String catCode) {
		
		return  mapper.getProdCategory(catCode);
	}

	//팝업 이미지 가져오기
	@Override
	public List<PostDTO> getPopImg(String popNum) {

		return mapper.getPopImg(popNum);
	}



}
