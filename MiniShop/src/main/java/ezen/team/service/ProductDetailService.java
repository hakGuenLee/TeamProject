package ezen.team.service;

import ezen.team.domain.ProductDTO;

public interface ProductDetailService {

	//상품 상세정보 가져오기
	ProductDTO getProductInfo(String no);

}
