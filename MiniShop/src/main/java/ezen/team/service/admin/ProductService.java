package ezen.team.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.ProductDTO;

public interface ProductService {

	//상품 등록
	void prodRegister(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception;

	//상품 리스트
	List<ProductDTO> prodList();

}
