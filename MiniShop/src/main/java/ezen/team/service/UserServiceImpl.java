	package ezen.team.service;

import java.sql.Date;
import java.util.Map;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import ezen.team.domain.UserDTO;
import ezen.team.mapper.UserMapper;

//UserController와 연결

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	/////////// 카카오 로그인     //////////////

	// 카카오 로그인을 위한 토큰 가져오기
	@Override
	public String getToken(String code) {
		
		//요청 메시지 시작
		// 헤더값 설장 ( 필수 항복 )
		HttpHeaders header = new HttpHeaders();
		
		header.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 바디값 설정 ( 필수 항목 )
		LinkedMultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type","authorization_code");
        body.add("client_id","46130752fef71518c9e7e66cfc149760");
        body.add("redirect_uri","http://localhost:8887/user/kakaoLogin");
        body.add("code",code);
		
        HttpEntity<LinkedMultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, header);
        
        // 요청 메시지 끝
        
        // 웹브라우저 역할을 하는 객체
        RestTemplate restTemplate = new RestTemplate();
        // 특정 서버에 요청을 전달하기
        ResponseEntity<String> responseEntity = restTemplate.exchange(
        "https://kauth.kakao.com/oauth/token", // 토큰 요청주소
        HttpMethod.POST, // 요청 방식
        requestEntity, // http 요청메시지
        String.class // 응답받을 타입
        );
        
        // body의 정보값만 가져온다
        String userInfo = responseEntity.getBody();

        //GSON 라이브러리를 이용하여 액세스 토큰 값 추출하기
        Gson gson = new Gson();

        Map<?,?> mapDate = gson.fromJson(userInfo, Map.class); // map 컬렉션 구조로 변경
        

        // 맵 구조에서 value만 리턴 // access_token의 값만 리턴
        return (String)mapDate.get("access_token");
	}	
	
	
	@Override
	public UserDTO getUserInfo(String accessToken) {

		/* 요청 메시지 생성 시작*/
        HttpHeaders header = new HttpHeaders();
        // 헤더값 설정 ( 필수 항복  Bearer 뒤에 공백 한칸 필수 )	
        header.add("Authorization", "Bearer "+accessToken);
        header.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        //HttpEntity 에서 body는 생략가능
        HttpEntity<LinkedMultiValueMap<String, String>> requestEntity = new HttpEntity<>(header);

        /* 요청 메시지 생성 끝*/

        // 웹브라우저 역할을 하는 객체
        RestTemplate restTemplate = new RestTemplate();

        // 특정 서버에 요청을 전달하기
        ResponseEntity<String> responseEntity = restTemplate.exchange(
        "https://kapi.kakao.com/v2/user/me", // 사용자 정보 요청주소
        HttpMethod.POST, // 요청 방식
        requestEntity, // http 요청메시지
        String.class // 응답받을 타입
        );
        
        
        String userInfo = responseEntity.getBody();

        Gson gson = new Gson();
        Map<?,?> mapDate = gson.fromJson(userInfo, Map.class);

//        String name = (String) ((Map<?,?>)(mapDate.get("kakao_account"))).get("nickname");
        String name = (String) ((Map<?,?>)(mapDate.get("properties"))).get("nickname");
        String email = (String) ((Map<?,?>)(mapDate.get("kakao_account"))).get("email");
//        Date birth = (Date) ((Map<?,?>)(mapDate.get("birth"))).get("birthday");

        UserDTO user = new UserDTO();
        
//        System.out.println(name);
        user.setUser_id(email);
        user.setUser_pw("1212");
        user.setUser_email(email);
        user.setUser_nm(name);
//        user.setUser_dt(birth);

        return user;

    }

	
	
	
	
	
	
	
	
	/////////// 카카오 로그인     //////////////
	
	
	// 회원 가입처리
	@Override
	public void userRegister(UserDTO userDTO) {
		
		
		String inputPw = userDTO.getUser_pw();
		
		String dbPw = pwEncoder.encode(inputPw);
		
		userDTO.setUser_pw(dbPw);
		
		mapper.userRegister(userDTO);
	}
	
	//회원가입 시 아이디 중복체크
	@Override
	public UserDTO userIdChk( String user_id) {

		UserDTO userDTO = mapper.userIdChk(user_id);
		
		return userDTO;
	}

	// 회원가입 시 이메일 인증
	@Override
	public String userEmailChk(String user_email) {
		
		// 인증코드 생성 // UUID는 자바에서 주는 뭐시기
		String uuid = UUID.randomUUID().toString().substring(0, 4);
		
		MimeMessage mail =  mailSender.createMimeMessage();
		
		// 보내는 메일에 쓸 문장
		String contents =  "<h3>귀염뽀짝 학근이가 메일을 확인하려고 합니다</h3></br>" +
				"<span>귀염뽀짝 학근이가 사용자 본인임을 확인 하려고 합니다. 다음 코드를 입력하세요</span>" +
				"<h2>"+uuid+"</h2>";
		
		try {
			// 보내는 메일의 제목 / 제목 / 형식
			mail.setSubject("귀염뽀짝 학근이가 보낸 메일","utf-8");
			// 내용 / 위에 만든 내용 / 형식
			mail.setText(contents,"utf-8","html");
			// 상대방 메일 세팅 TO 보낸다
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(user_email));
			
			//설정오나료
			mailSender.send(mail);
			
			return uuid;

			
		} catch (MessagingException e) {
		}
		return"fail";
		
	}

	// 로그인 처리
	@Override
	public boolean userLogin(HttpServletRequest rq) {
		
		HttpSession session = rq.getSession();
		
		UserDTO userDTO = mapper.userLogin(rq.getParameter("user_id"));
		
		if(userDTO != null) { // 널이 아니면 회원정보가 있는거니 pw를 비교
			
			String inputPw = rq.getParameter("user_pw"); // 입력한 PW
			String dbPw = userDTO.getUser_pw(); // DB에 있는 PW
			
			if(pwEncoder.matches(inputPw, dbPw)) {// 비교해서 맞으면 참 , 틀리면 거짓
				
				session.setAttribute("userDTO", userDTO);
				return true;
			}else { // 비밀번호가 틀리면
				return false;
			}
			
		}
		return false;// 회원정보가 없으면
	}

	
	
	// Id찾기
	@Override
	public String findId(UserDTO userDTO) {
		
		// 없으면 리턴값이 0
		return mapper.findId(userDTO);
	}

	//Pw찾기
	@Override
	public String findPw(UserDTO userDTO) {
		
		UserDTO dbDTO = mapper.findPw(userDTO);

		String userEmail = userDTO.getUser_email(); // 사용자가 입력한 email
		
		if(dbDTO==null) { // null 이면 id , email로 찾아봤을 때 없는 것
			
			return "fail";
		}
		
		String dbEmail = dbDTO.getUser_email(); // db에 있는 email

		if(userEmail.equals(dbEmail)) { // 이메일이 같으면 인증코드를 보내준다.
			
			String uuid = UUID.randomUUID().toString().substring(0,4);
			
			MimeMessage mail = mailSender.createMimeMessage();
			
			String content =   "<h3>이메일 주소 확인</h3></br>" +
					"<span>사용자가 본인임을 확인 하려고 합니다. 다음 코드를 입력하세요</span>" +
					"<h2>"+uuid+"</h2>";
			try {
				// 보내는 메일의 제목 / 제목 / 형식
				mail.setSubject("용식 메일" , "utf-8");
				// 내용 / 형식
				mail.setText(content,"utf-8","html");
				// 메일 보낼 곳 세팅
				mail.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
				mailSender.send(mail);
				
				return uuid;
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
		return "faul";
	}

	@Override
	public void pwChange(String user_id, String user_pw) {

		// user_pw를 암호화 시켜서 재할당
		user_pw = pwEncoder.encode(user_pw);
		
		mapper.pwChange(user_id,user_pw);
	}





}
