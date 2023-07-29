/*
 * package ezen.team.security.config;
 * 
 * import org.springframework.context.annotation.Configuration; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import
 * org.springframework.security.config.annotation.web.builders.WebSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.config.annotation.web.configuration.
 * WebSecurityConfigurerAdapter;
 * 
 * @Configuration
 * 
 * @EnableWebSecurity public class SecurityConfig extends
 * WebSecurityConfigurerAdapter {
 * 
 * //WebSecurityConfigurerAdapter : 보안 설정을 위한 클래스
 * 
 * 
 * //인증,인가에 대한 설정
 * 
 * @Override protected void configure(HttpSecurity http) throws Exception {
 * 
 * http .authorizeRequests() // 특정 리소스에 대한 권한 설정 .antMatchers("/").permitAll()
 * .anyRequest().authenticated();
 * 
 * 
 * 
 * }
 * 
 * 
 * }
 */