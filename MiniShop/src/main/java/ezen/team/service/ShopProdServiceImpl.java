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
	
		return mapper.getFruit();
	}
	
	//견과, 특용작물 가져오기
	@Override
	public List<ProductDTO> getNuts() {

		return mapper.getNuts();
	}

	//냉동과일 가져오기
	@Override
	public List<ProductDTO> getIceFruit() {
			
		return mapper.getIceFruit();
	}

	//잎채소 가져오기
	@Override
	public List<ProductDTO> getLeap() {
				
		return mapper.getLeap();
	}

	//열매채소 가져오기
	@Override
	public List<ProductDTO> getFruitVege() {
		
		return mapper.getFruitVege();
	}

	//뿌리채소 가져오기
	@Override
	public List<ProductDTO> getRootVege() {
		
		return mapper.getRootVege();
	}

	//버섯 가져오기
	@Override
	public List<ProductDTO> getMushRoom() {
	
		return mapper.getMushRoom();
	}

	//나물 가져오기
	@Override
	public List<ProductDTO> getNamuel() {

		return  mapper.getNamuel();
	}

	//한우 가져오기
	@Override
	public List<ProductDTO> getCow() {
		
		return mapper.getCow();
	}

	//돈육 가져오기
	@Override
	public List<ProductDTO> getPig() {
	
		return mapper.getPig();
	}

	//닭 오리 가져오기
	@Override
	public List<ProductDTO> getChicken() {
	
		return mapper.getChicken();
	}

	//아우터 가져오기
	@Override
	public List<ProductDTO> getOuter() {
	
		return  mapper.getOuter();
	}

	//유정란 제품 가져오기
	@Override
	public List<ProductDTO> getEgg() {
	
		return  mapper.getEgg();
	}

	//팬츠 가져오기
	@Override
	public List<ProductDTO> getPants() {
	
		return mapper.getPants();
	}

	//스커트 가져오기
	@Override
	public List<ProductDTO> getSkirt() {
	
		return mapper.getSkirt();
	}

	//상의 가져오기
	@Override
	public List<ProductDTO> getTop() {
	
		return  mapper.getTop();
	}

	//주방가전 가져오기
	@Override
	public List<ProductDTO> getCook() {
	
		return mapper.getCook();
	}

	//생활가전 가져오기
	@Override
	public List<ProductDTO> getLifeElectro() {
		
		return mapper.getLifeElectro();
	}

	//욕실가전 가져오기
	@Override
	public List<ProductDTO> getBathElectro() {
	
		return mapper.getBathElectro();
	}

}
