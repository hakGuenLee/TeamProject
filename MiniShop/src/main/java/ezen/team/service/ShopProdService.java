package ezen.team.service;

import java.util.List;

import ezen.team.domain.ProductDTO;

public interface ShopProdService {

	//과일카테고리 제품 가져오기
	List<ProductDTO> getFruit();

	////견과, 특용작물 가져오기
	List<ProductDTO> getNuts();

	//냉동과일 가져오기
	List<ProductDTO> getIceFruit();

	//잎채소 가져오기
	List<ProductDTO> getLeap();

	//열매채소 가져오기
	List<ProductDTO> getFruitVege();

	//뿌리채소 가져오기
	List<ProductDTO> getRootVege();

	//버섯 가져오기
	List<ProductDTO> getMushRoom();

	//나물 가져오기
	List<ProductDTO> getNamuel();

	//한우 가져오기
	List<ProductDTO> getCow();

	//돈육 가져오기
	List<ProductDTO> getPig();

	//닭/오리 가져오기
	List<ProductDTO> getChicken();

}
