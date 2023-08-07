package ezen.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.ProductDTO;
import ezen.team.mapper.ShopProdMapper;

@Service
public class ShopProdServiceImpl implements ShopProdService {

	@Autowired
	private ShopProdMapper mapper;
	
	//과일 제품 가져오기
	@Override
	public List<ProductDTO> getFruit() {
		
		List<ProductDTO> fruitList = mapper.getFruit();
		
		return fruitList;
	}
	
	//견과, 특용작물 가져오기
	@Override
	public List<ProductDTO> getNuts() {

		List<ProductDTO> nutsList = mapper.getNuts();
		
		return nutsList;
	}

	//냉동과일 가져오기
	@Override
	public List<ProductDTO> getIceFruit() {
		
		List<ProductDTO> iceFruitlist = mapper.getIceFruit();
		return iceFruitlist;
	}

	//잎채소 가져오기
	@Override
	public List<ProductDTO> getLeap() {
		
		List<ProductDTO> leapList = mapper.getLeap();
		return leapList;
	}

	//열매채소 가져오기
	@Override
	public List<ProductDTO> getFruitVege() {
		List<ProductDTO> fruitVegeList = mapper.getFruitVege();
		return fruitVegeList;
	}

	//뿌리채소 가져오기
	@Override
	public List<ProductDTO> getRootVege() {
		List<ProductDTO> rootVegeList = mapper.getRootVege();
		return rootVegeList;
	}

	//버섯 가져오기
	@Override
	public List<ProductDTO> getMushRoom() {
		List<ProductDTO> mushRoomList = mapper.getMushRoom();
		return mushRoomList;
	}

	//나물 가져오기
	@Override
	public List<ProductDTO> getNamuel() {
		List<ProductDTO> namuelList = mapper.getNamuel();
		return namuelList;
	}

	//한우 가져오기
	@Override
	public List<ProductDTO> getCow() {
		List<ProductDTO> cowList = mapper.getCow();
		return cowList;
	}

	//돈육 가져오기
	@Override
	public List<ProductDTO> getPig() {
		List<ProductDTO> pigList = mapper.getPig();
		return pigList;
	}

	//닭 오리 가져오기
	@Override
	public List<ProductDTO> getChicken() {
		List<ProductDTO> chickList = mapper.getChicken();
		return chickList;
	}

	//아우터 가져오기
	@Override
	public List<ProductDTO> getOuter() {
		List<ProductDTO> pDto = mapper.getOuter();
		return pDto;
	}

	//유정란 제품 가져오기
	@Override
	public List<ProductDTO> getEgg() {
		List<ProductDTO> egglist = mapper.getEgg();
		return egglist;
	}

	//팬츠 가져오기
	@Override
	public List<ProductDTO> getPants() {
		List<ProductDTO> pants = mapper.getPants();
		return pants;
	}

	//스커트 가져오기
	@Override
	public List<ProductDTO> getSkirt() {
		List<ProductDTO> list = mapper.getSkirt();
		return list;
	}

	//상의 가져오기
	@Override
	public List<ProductDTO> getTop() {
		List<ProductDTO> list = mapper.getTop();
		return list;
	}

	//주방가전 가져오기
	@Override
	public List<ProductDTO> getCook() {
		List<ProductDTO> list = mapper.getCook();
		return list;
	}

}
