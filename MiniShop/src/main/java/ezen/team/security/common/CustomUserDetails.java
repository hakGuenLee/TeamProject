//package ezen.team.security.common;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.Date;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//
//public class CustomUserDetails implements UserDetails {
//	
//	private String adm_id; //관리자ID
//	private String adm_vnm; //관리자명(별칭)
//	private String adm_nm; //관리자명(실명)
//	private String adm_pw; //비밀번호
//	private String emp_id; //관리자 사번
//	private String use_yn; //사용구분
//	private Date proc_dt; //등록일
//	private Date mod_dt; //수정일
//	private Date exp_dt; //종료일
//	private String proc_id; //등록처리자
//	private String mod_id; //수정처리자
//	private String exp_id; //종료처리자
//	private String role; //권한
//	private String auth;
//	private int enabled;
//	
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
//		
//		
//		return authList;
//	}
//	@Override
//	public String getPassword() {
//		// TODO Auto-generated method stub
//		return adm_pw;
//	}
//	@Override
//	public String getUsername() {
//		// TODO Auto-generated method stub
//		return adm_id;
//	}
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return enabled ==1?true:false;
//	}
//	
//	
//	
//
//}
