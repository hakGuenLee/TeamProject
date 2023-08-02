package ezen.team.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ezen.team.domain.ProductDTO;
import ezen.team.service.ShopProdService;

@Controller
public class ShopProdController {
	
	@Autowired
	private ShopProdService service;
	
	
	//과일상품 페이지 이동
	@GetMapping("/fruitPage0")
	public String fruit(Model model) {
		
		//과일 상품 리스트 가져오기
		List<ProductDTO> fruitList = service.getFruit();
		
		model.addAttribute("list", fruitList);
		
		return "/user/fruit";
	}
	
	//견과, 특용작물 페이지 이동
	@GetMapping("/fruitPage1")
	public String nuts(Model model) {
		
		////견과, 특용작물 가져오기
		List<ProductDTO> nutsList = service.getNuts();
		
		model.addAttribute("list", nutsList);
		
		return "/user/nuts";
	}
	
	//냉동과일 페이지 이동
	@GetMapping("/fruitPage2")
	public String iceFruit(Model model) {
		
		List<ProductDTO> iceList = service.getIceFruit();
		
		model.addAttribute("list", iceList);
		
		return "/user/iceFruit";
		
	}
	
	//잎채소 페이지 이동
	@GetMapping("/vegePage0")
	public String leap(Model model) {
		
		List<ProductDTO> leapList = service.getLeap();
		
		model.addAttribute("list", leapList);
		
		return "/user/leapVege";
	
	}
	
	//열매채소 페이지 이동
	@GetMapping("/vegePage1")
	public String fruitVege(Model model) {
		
		List<ProductDTO> fruitVegelist = service.getFruitVege();
		
		model.addAttribute("list", fruitVegelist);
		
		return "/user/fruitVege";
	}
	
	//뿌리채소 페이지 이동
	@GetMapping("/vegePage2")
	public String rootVege(Model model) {
		
		List<ProductDTO> rootVegeList = service.getRootVege();
		
		model.addAttribute("list", rootVegeList);
		
		return "/user/rootVege";
	}
	
	//버섯 페이지 이동
	@GetMapping("/vegePage3")
	public String mushRoom(Model model) {
		
		List<ProductDTO> mushRoomList = service.getMushRoom();
		
		model.addAttribute("list", mushRoomList);
		
		return "/user/mushRoom";
		
	}
	
	//나물 페이지 이동
	@GetMapping("/vegePage4")
	public String namuel(Model model) {
		
		List<ProductDTO> namuelList = service.getNamuel();
		
		model.addAttribute("list", namuelList);
		
		return "/user/namuel";
	}
	
	//한우페이지 이동
	@GetMapping("/meetPage0")
	public String Cow(Model model) {
		
		List<ProductDTO> CowList = service.getCow();
		
		model.addAttribute("list", CowList);
		
		return "/user/cow";
	}
	
	//돈육페이지 이동
	@GetMapping("/meetPage1")
	public String pig(Model model) {
		
		List<ProductDTO> pitList = service.getPig();
		
		model.addAttribute("list", pitList);
		
		return "/user/pig";
	}
	
	//닭/오리 페이지 이동
	@GetMapping("/meetPage2")
	public String chicken(Model model) {
		
		List<ProductDTO> chickenList = service.getChicken();
		
		model.addAttribute("list", chickenList);
		
		return "/user/chicken";
	}
	

}
