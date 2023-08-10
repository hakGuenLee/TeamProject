package ezen.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.ProductDTO;
import ezen.team.mapper.ProductDetailMapper;

//상품 상세보기 담당 서비스

@Service
public class ProductDetailServiceImpl implements ProductDetailService {

	@Autowired
	private ProductDetailMapper mapper;
	
	//상품 상세정보 가져오기
	@Override
	public ProductDTO getProductInfo(String no) {
		
		return mapper.getProductInfo(no);
	}

}
