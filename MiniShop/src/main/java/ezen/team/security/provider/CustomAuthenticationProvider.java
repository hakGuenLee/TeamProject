//package ezen.team.security.provider;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.InsufficientAuthenticationException;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//import ezen.team.domain.AdminDTO;
//import ezen.team.security.common.FormWebAuthenticationDetails;
//
//
////AuthenticationProvider 구현체
////위임 받아서 실제로 인증 절차를 처리하는 클래스
//public class CustomAuthenticationProvider implements AuthenticationProvider {
//
//	//사용자의 정보를 가져오는 인터페이스
//	@Autowired
//	private UserDetailsService userDetailsService;
//	
//	//비밀번호 암호화
//	@Autowired
//	private PasswordEncoder passwordEncoder;
//	
//	@Override
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//	
//		//사용자(==즉, 관리자)가 입력한 id, pw를 가져옴
//		
//		String id = authentication.getName();
//		String pw = (String) authentication.getCredentials();
//		
//		AdminDTO adminDto = (AdminDTO) userDetailsService.loadUserByUsername(id);
//		System.out.println(adminDto);
//		
//		if(!passwordEncoder.matches(pw, adminDto.getAdm_pw())) {
//			throw new BadCredentialsException("Invalid Password");
//		}
//		
//		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(adminDto.getAdm_id(),adminDto.getRole());
//		
//		FormWebAuthenticationDetails formWebAuthenticationDetails = (FormWebAuthenticationDetails) authentication.getDetails();
//		
//		String secretKey = formWebAuthenticationDetails.getSecretKey();
//		
//		if(secretKey == null || !"secretData".equals(secretKey)) {
//			System.out.println("secreyKey Error!!");
//			throw new InsufficientAuthenticationException("InsufficientAuthenticationException");
//		}
//		
//		
//		return authenticationToken;
//	}
//
//	@Override
//	public boolean supports(Class<?> authentication) {
//
//		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
//	}
//
//}
