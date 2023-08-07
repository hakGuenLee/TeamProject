package ezen.team.mapper.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.PageDTO;
import ezen.team.domain.ProductDTO;

//ProductServiceImpl과 연결

@Mapper
public interface ProductMapper {

	int prodRegister(Map map);

	List<ProductDTO> prodList(PageDTO pagedto);
	
	//상품 전체 수 
	int totalCnt(PageDTO pagedto);
	
	//상품 리스트 가져오기
	ProductDTO getListByNo(String no);

	//상품 수정
	void prodUpdate(Map map);

	//상품 삭제
	void prodDelete(String no);

	//상품 정보 가져오기
	ProductDTO getProdInfo(String no);



}
