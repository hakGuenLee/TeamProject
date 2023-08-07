package ezen.team.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.team.domain.UserDTO;
import ezen.team.service.UserService;

/*
로그인
로그아웃
아이디 찾기
비밀번호 찾기
회원가입 처리
*/

/*
마이페이지 이동
마이페이지_찜리스트
마이페이지_적립금
마이페이지_1:!문의내역
마이페이지_주문/배송조회
마이페이지_제품문의내역
마이페이지_회원탈퇴
마이페이지_회원정보 수정
 */


@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	UserService userService;
	
	//로그인 페이지 이동
	@GetMapping("/userLogin")
	public String userLogin() {
	
		return "/user/userLogin";
	}
	// 유저 로그인 처리
	@PostMapping("/userLogin") //RedirectAttributes 는 Redirect 시에도 정보를 넘겨준다
	public String userLogin( HttpServletRequest rq, RedirectAttributes rd) {
		
	boolean result = userService.userLogin(rq);
		
	// result = 회원정보가 있으면 참 , 없으면 거짓
	if(!result) {// 회원정보가 없으면
		
		rd.addFlashAttribute("result","오류");
		return "redirect:/user/userLogin";
	}
	
		return"redirect:/";
	}
	
	// 카카오 로그인 처리
	 @GetMapping("/kakaoLogin")
	    public String kakaoCb(@RequestParam("code")String code, HttpSession session){

		 
		 	// 액세스 토큰 가져오기
	        String accessToken = userService.getToken(code);

	        System.out.println(accessToken);
	        
	        // 3 . 사용자정보 가져오기
	         UserDTO kakaoUser = userService.getUserInfo(accessToken);


	        // 4. 사용자 정보를 이용해서 DB에 저장
	            // DB에 저장 하기 전에 이미 저장된 회원인지 확인하기
	        UserDTO findUser = userService.userIdChk(kakaoUser.getUser_id());
	        
	        if(findUser==null) {
	        	userService.userRegister(kakaoUser);
	        }

	        // 5. 인증 처리
	        session.setAttribute("userDTO",kakaoUser);

	        return "redirect:/";

	    }
	
	
	// 유저 로그아웃 처리
	@GetMapping("userLogout")
	public String userLogout(HttpSession session) {
		
		session.invalidate();// 세션 로그아웃
		
		return"redirect:/";
		
	}
	
	
	
	
	// 아이디 비밀번호 찾기 이동
	@GetMapping("/idpwSearch") // id찾기인지 pw찾기인지 param으로 가져오기
	public String idSearch(@RequestParam("find")String find,Model model) {
		
		model.addAttribute("find",find);
		// 가져와서 보내 준 후 if문으로 active 시켜줘서 display 띄워주기
		
		return "/user/idpwSearch";
	}
	// 아이디 찾기
	@PostMapping("/findId")
	public @ResponseBody String findId(UserDTO userDTO) {
		
		String resultId = userService.findId(userDTO);
		
		return resultId;
	}
	// 비밀번호 찾기
	@PostMapping("/findPw")
	public @ResponseBody String findPw(UserDTO userDTO) {
		
		String emailCode = userService.findPw(userDTO);
		
		return emailCode;
	}
	
    
    @PostMapping("pwChange")
    public @ResponseBody String pwChange(@Param("user_pw") String user_pw,
    							@Param("newUser_pwChk") String newUser_pwChk,
    							@Param("user_id")String user_id) {
    	
    	
    	// 새로 입력한 비밀번호 중복체크
    	if(user_pw.equals(newUser_pwChk)) {
    		
    		userService.pwChange(user_id,user_pw);
    		
    		return "Yes";
    	}
    	
    
    	return "fail";
    	
    }
	
	
	
	
	
	// 회원가입 페이지 이동
	@GetMapping("/userRegister")
	public String userRegister() {
		
		return "/user/userRegister";
	}
	//회원가입 등록
	@PostMapping("/userRegister")
	public String userRegister(UserDTO userDTO) {
		
		userService.userRegister(userDTO);
		
		return "redirect:/user/userLogin";
	}
	
	//회원가입 시 아이디 중복체크
	@GetMapping("/userIdChk")
	@ResponseBody
	public String userIdChk(@RequestParam("user_id")String user_id) {
		UserDTO userDTO =  userService.userIdChk(user_id);
		if(userDTO != null || "".equals(user_id.trim())) {
			return "N";
		}
		return "yes";
	}
	
	//회원가입 시 아이디 중복체크
	@GetMapping("/userEmailChk")
	@ResponseBody
	public String userEmailChk(@RequestParam("user_email")String user_email) {
		
		String uuid = userService.userEmailChk(user_email);
		
		return uuid;
		
	}


}
