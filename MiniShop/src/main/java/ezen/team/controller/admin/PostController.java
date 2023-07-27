package ezen.team.controller.admin;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.PostDTO;
import ezen.team.service.admin.PostService;



/* 
공지사항 등록
팝업 등록
승인 요청하기
 */

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	// 게시글 등록 페이지 이동
	@GetMapping("/postRegister")
	public String postRegister() {
		return "admin/postRegister";
	}
	
	
	
	// 게시글 등록 처리 완료
	@PostMapping("/postRegister")
	public String postRegister(MultipartHttpServletRequest mhr, 
			HttpServletRequest request) throws Exception {
		
		postService.postRegister(mhr,request);
		
		return "redirect:/post/postList";
	}
	
	
	
	
	
	// 게시글 리스트 페이지 이동
	@GetMapping("/postList")
	public String postList(Model model) {
		
		List<PostDTO> pList = postService.getList();
		
		model.addAttribute("pList",pList);
		
		return "admin/postList";
	}
	
	
	
	
	
	// 썸머노트 실패 !!
//	@PostMapping(value="noticeRegister1", produces = "application/json")
//	@ResponseBody
//	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
//		
//		JsonObject jsonObject = new JsonObject();
//		
//		String fileRoot = "C:\\study_project\\git\\TeamProject\\MiniShop\\src\\main\\webapp\\resources\\upload\\";	//저장될 외부 파일 경로
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//				
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		
//		File targetFile = new File(fileRoot + savedFileName);	
//		
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
//			jsonObject.addProperty("responseCode", "success");
//				
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		
//		return jsonObject;
//	}
	
}
