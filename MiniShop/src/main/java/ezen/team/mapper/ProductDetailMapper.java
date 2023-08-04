package ezen.team.mapper;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.ProductDTO;

//상품 상세 담당 mapper

@Mapper
public interface ProductDetailMapper {

	//상품 상세정보 가져오기
	ProductDTO getProductInfo(String no);

}
