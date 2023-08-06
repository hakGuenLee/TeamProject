//
 package ezen.team.security.config;
//
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.reactive.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//
import ezen.team.security.common.FormAuthenticationDetailsSource;
import ezen.team.security.handler.CustomAccessDeniedHandler;
import ezen.team.security.handler.CustomAuthenticationFailureHandler;
import ezen.team.security.provider.CustomAuthenticationProvider;

////Spring Security 환경설정
//
@Configuration
 @EnableWebSecurity 
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private FormAuthenticationDetailsSource formAuthenticationDetailsSource;
	
	
	@Autowired
	private CustomAuthenticationFailureHandler customAuthenticationFailureHandler;

	
	
//	//정적 파일 접근 필터 해제
	@Override
	public void configure(WebSecurity web) throws Exception {

		 web.ignoring().antMatchers("/resources/js/*.js", "/resources/css/*.css", "/resources/imgs/*.jpg", "/resources/imgs/*.png", "/resources/upload/*.jpg", "/resources/upload/*.png", 
				 "/resources/upload/*.jpeg");

//			
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(customProvider());
		auth.eraseCredentials(false);
//		
		auth.inMemoryAuthentication().withUser("test").password("{noop}1234").roles("SUPER_ADMIN");
	}
	

	//customProvider를 빈으로 등록
	@Bean
	public AuthenticationProvider customProvider() {
		return new CustomAuthenticationProvider();
	}
	
	@Bean
	public PasswordEncoder pwEncoder() {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder;
	}
//	
//	
//	//인증, 인가 권한 설정
	@Override
	protected void configure(HttpSecurity http) throws Exception { 
		
		   http
//		   		.cors().disable()
		         .csrf().disable()
//		         .formLogin().disable()
//		         .headers().frameOptions().disable();
		
		
		
			.authorizeRequests()
			.antMatchers("/", "/adminLogin", "/cart/**", "/user/**", "/getProdCategoryList", "/productPage/**", "/myPage/**", "/prodDetail/**").permitAll()
			.antMatchers("/admin/**").hasAnyAuthority("ROLE_ADMIN")
			.anyRequest().authenticated()
			
		.and()
			.formLogin()   //formlogin방식 적용
			.loginPage("/adminLogin")
			.loginProcessingUrl("/login") //로그인 처리 URL
			.defaultSuccessUrl("/admin/adminHome") //로그인 성공 시 URL
			.authenticationDetailsSource(formAuthenticationDetailsSource)
			.failureHandler(customAuthenticationFailureHandler) //로그인 실패 시 처리하는 Handler
			.permitAll()
			
			//인가 예외 발생하였을 경우 처리하는 Handler
		.and()
			.exceptionHandling()
			.accessDeniedHandler(accessDeniedHandler());
	}
	
	//인가 예외 처리 Handler
	private AccessDeniedHandler accessDeniedHandler() {
		
		CustomAccessDeniedHandler customDeniedHandler = new CustomAccessDeniedHandler();
		customDeniedHandler.setErrorPage("/denied");
		return customDeniedHandler;
		
	}
	 

 }
