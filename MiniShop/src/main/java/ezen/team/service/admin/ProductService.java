package ezen.team.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.PageDTO;
import ezen.team.domain.ProductDTO;

public interface ProductService {

	//상품 등록
	void prodRegister(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception;

	//상품 리스트
	List<ProductDTO> prodList(PageDTO pagedto);

	ProductDTO prodListByNo(String no);

	void prodUpdate(MultipartHttpServletRequest mhr, HttpServletRequest rq) throws Exception;

	void prodDelete(String no, HttpServletRequest request);

	//상품명으로 상품 검색하기
	List<ProductDTO> prodSearch(String search);

}
