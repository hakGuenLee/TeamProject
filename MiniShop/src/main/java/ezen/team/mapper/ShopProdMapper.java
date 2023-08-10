package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.ProductDTO;

@Mapper
public interface ShopProdMapper {

	//과일제품 모두 가져오기
	List<ProductDTO> getFruit();

	//견과, 특용작물 가져오기
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

	//닭, 오리 가져오기
	List<ProductDTO> getChicken();

	//아우터 가져오기
	List<ProductDTO> getOuter();

	//유정란 가져오기
	List<ProductDTO> getEgg();

	//팬츠 가져오기
	List<ProductDTO> getPants();

	//스커트 가져오기
	List<ProductDTO> getSkirt();

	//상의 가져오기
	List<ProductDTO> getTop();

	//주방가전 가져오기
	List<ProductDTO> getCook();

	//생활가전 가져오기
	List<ProductDTO> getLifeElectro();

	//욕실가전 가져오기
	List<ProductDTO> getBathElectro();

}
