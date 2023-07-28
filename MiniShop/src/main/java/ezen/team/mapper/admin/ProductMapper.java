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
	int totalCnt(PageDTO pagedto);
	

	ProductDTO getListByNo(String no);

	void prodUpdate(Map map);

	void prodDelete(String no);



}
