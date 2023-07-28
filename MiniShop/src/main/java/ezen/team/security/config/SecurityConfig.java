package ezen.team.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	//WebSecurityConfigurerAdapter : 보안 설정을 위한 클래스
	
	
	
	//Spring Security를 적용하지 않을 리소스 설정하는 메소드
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("**/*.js", "**/*.css");
		
	}

	//인증,인가에 대한 설정
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	
        http
        .authorizeRequests()
        // 특정 리소스에 대한 권한 설정
        .antMatchers("/", "/join", "/login*").permitAll()
				
			.and()
				.formLogin()
				.loginPage("/admin/adminLogin")
				.defaultSuccessUrl("/admin/adminHome")
				.permitAll();
		
		
	}
	
	
}
