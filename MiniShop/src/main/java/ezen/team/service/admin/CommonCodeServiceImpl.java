package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CategoryDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.ProductDTO;
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

	//상품 카테고리 가져오기
	@Override
	public List<CategoryDTO> getProdCategory(String catCode) {

		List<CategoryDTO> list = mapper.getProdCategory(catCode);
		
		return list;
	}

	//해당 번호에 맞는 상품 리스트 가져오기(홈 화면)
	@Override
	public List<ProductDTO> getProdBox(String ctNo) {
	
		List<ProductDTO> list = mapper.getProdBox(ctNo);
		
		return list;
	}

}
