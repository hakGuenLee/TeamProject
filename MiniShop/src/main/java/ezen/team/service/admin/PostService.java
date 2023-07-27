package ezen.team.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.PostDTO;


//NoticeController와 연결
public interface PostService {

	void postRegister(MultipartHttpServletRequest mhr, 
			HttpServletRequest request) throws Exception;

	List<PostDTO> getList();

}
