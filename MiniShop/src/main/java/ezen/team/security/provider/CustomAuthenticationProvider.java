package ezen.team.security.provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import ezen.team.security.common.AdminContext;
import ezen.team.security.common.FormWebAuthenticationDetails;


//AuthenticationProvider 구현체
//위임 받아서 실제로 인증 절차를 처리하는 클래스
public class CustomAuthenticationProvider implements AuthenticationProvider {

	//사용자의 정보를 가져오는 인터페이스
	@Autowired
	private UserDetailsService userDetailsService;
	
	//비밀번호 암호화
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	
		//사용자(==즉, 관리자)가 입력한 id, pw를 가져옴
		
		String username = authentication.getName();
		
		System.out.println("authentication.get " + authentication.getCredentials());
		
		//String.valueOf
		String password = (String)authentication.getCredentials();
		
		System.out.println("username : " + username );
		System.out.println("프로바이더 password : " + password );
		
		AdminContext adminContext = (AdminContext) userDetailsService.loadUserByUsername(username);
		System.out.println(adminContext);
		
		System.out.println("어드민 컨텍스트 : " + adminContext.getPassword());
		
		//일치여부 확인
		if(!passwordEncoder.matches(password, adminContext.getPassword())) {
			throw new BadCredentialsException("Invalid Password");
		}
		
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(adminContext.getUsername(), null, adminContext.getAuthorities());
		
		FormWebAuthenticationDetails formWebAuthenticationDetails = (FormWebAuthenticationDetails) authentication.getDetails();
		
		String secretKey = formWebAuthenticationDetails.getSecretKey();
		
		System.out.println("프로바이더 secretKey : " + secretKey);
		
		if(secretKey == null || !"secretData".equals(secretKey)) {
			System.out.println("secreyKey Error!!");
			throw new InsufficientAuthenticationException("InsufficientAuthenticationException");
		}
		
		
		return authenticationToken;
	}

	@Override
	public boolean supports(Class<?> authentication) {

		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
