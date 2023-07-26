package ezen.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.team.domain.CommonCodeDTO;
import ezen.team.service.admin.CommonCodeService;

//공통코드 호출 처리 컨트롤러

@Controller
public class CommonCodeController {
	
	@Autowired
	CommonCodeService service;
	
	
	@PostMapping("/getCode")
	@ResponseBody
	public List<CommonCodeDTO> getCode(@RequestParam("code") String code) {
		
		System.out.println("공통컨트롤러 코드 : " + code);
		
		List<CommonCodeDTO> codelist = service.getCode(code);
		
		System.out.println("코드리스트 : " + codelist);
		
		
		
		return codelist;
	}

}
