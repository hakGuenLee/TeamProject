package ezen.team.service;

import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
		
		return 	mapper.userIdChk(user_id);
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




}
