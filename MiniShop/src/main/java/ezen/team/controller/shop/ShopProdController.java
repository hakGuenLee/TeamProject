package ezen.team.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.team.domain.ProductDTO;
import ezen.team.service.ShopProdService;

@Controller
@RequestMapping("/productPage")
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
	
	//유정란 페이지 이동
	@GetMapping("/meetPage3")
	public String egg(Model model) {
		
		List<ProductDTO> eggList = service.getEgg();
		
		model.addAttribute("list", eggList);
		
		return "/user/egg";
	}
	
	//아우터 페이지 이동
	@GetMapping("/clothPage0")
	public String outer(Model model) {
		List<ProductDTO> outerList = service.getOuter();
		
		model.addAttribute("list", outerList);
		
		return "/user/outer";
		
	}
	
	//팬츠 페이지 이동
	@GetMapping("/clothPage1")
	public String pants(Model model) {
		List<ProductDTO> list = service.getPants();
		
		model.addAttribute("list", list);
		
		return "/user/pants";
	}
	
	//스커트 페이지 이동
	@GetMapping("/clothPage2")
	public String skirt(Model model) {
		List<ProductDTO> skirtList = service.getSkirt();
		
		model.addAttribute("list", skirtList);
		
		return "/user/skirt";
	}
	
	//상의 페이지 이동
	@GetMapping("/clothPage3")
	public String top(Model model) {
		List<ProductDTO> top = service.getTop();
		model.addAttribute("list", top);
		
		return "/user/top";
	}
	
	//주방가전 페이지 이동
	@GetMapping("/electroPage0")
	public String cookElectro(Model model) {
		List<ProductDTO> list = service.getCook();
		model.addAttribute("list", list);
		
		return "/user/cook";
	}
	
	//생활가전 페이지 이동
	@GetMapping("/electroPage1")
	public String lifeElectro(Model model) {
		List<ProductDTO> list = service.getLifeElectro();
		model.addAttribute("list", list);
		
		return "/user/lifeElectro";
	}
	
	//욕실가전 페이지 이동
	@GetMapping("/electroPage2")
	public String bathElectro(Model model) {
		List<ProductDTO> list = service.getBathElectro();
		model.addAttribute("list", list);
		
		return "/user/bathElectro";
		
	}
	
	
	

}
