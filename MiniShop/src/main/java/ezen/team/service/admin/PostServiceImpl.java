package ezen.team.service.admin;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ezen.team.domain.PageDTO;
import ezen.team.domain.PostDTO;
import ezen.team.mapper.admin.PostMapper;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper mapper;
	
	// 공지 / 팝업 등록
	@Override
	public void postRegister(MultipartHttpServletRequest mhr, 
			HttpServletRequest rq) throws Exception{
		String repo = "/resources/upload";

		// 서버의 물리경로 얻어오기
		String savePath = rq.getServletContext().getRealPath("") + File.separator + repo;

		System.out.println(savePath);

		Map map = new HashMap();

		

		// mhr 텍스트파일, 바이너리 파일의 저옵를 모두 얻어올 수 있다.

		Enumeration<String> enu = mhr.getParameterNames();

		// 일반 텍스트 파일의 파라미터명(key), 해당 key의 value값을 가져오기
		while (enu.hasMoreElements()) {

			String paramName = enu.nextElement();
			String paramValue = mhr.getParameter(paramName);

			System.out.println(paramName);
			System.out.println(paramValue);

			map.put(paramName, paramValue);

		}

		// 파일
		Iterator<String> iter = mhr.getFileNames();

//		List<String> main_img = new ArrayList<String>();
		String pst_img = null;

		while (iter.hasNext()) {

			String fileParamName = iter.next();

			System.out.println("file=" + fileParamName);

			MultipartFile mFile = mhr.getFile(fileParamName);

			String originName = mFile.getOriginalFilename();

			System.out.println(originName);

			File file = new File(savePath + "\\" + fileParamName);

			if (mFile.getSize() != 0) { // 업로드 된 경우
				if (!file.exists()) {// 파일이 존재하지 않는경우 (!) // exists는 존재하면 true를 리턴
					if (file.getParentFile().mkdir()) { // savePath에 지정된 폴더(fileRepo) 생성
						file.createNewFile(); // 임시파일 생성
					}
				} // if 파일이 존재하지않는경우

				File uploadFile = new File(savePath + "\\" + originName);

				// 이미지 이름 중복 시 이미지 이름 대체
				if (uploadFile.exists()) {
					originName = System.currentTimeMillis() + "_" + originName;
					uploadFile = new File(savePath + "\\" + originName);

				}

				// 실제파일 업로드하기
				mFile.transferTo(uploadFile);
//				main_img.add(originName);
				pst_img=originName;
				
			} // if 업로드 된 경우
		} // while

		map.put("pst_img", pst_img);
		
		mapper.postRegister(map);
		
	}

	// 공지 목록 가져오기
	@Override
	public List<PostDTO> getList(PageDTO pagedto) {
		
		int totalCnt = mapper.totalCnt(pagedto);
		
		pagedto.setValue(totalCnt, pagedto.getCntPerPage());
		
		return mapper.getList(pagedto);
	}

	// 공지 정보 번호로 가져오기
	@Override
	public PostDTO getListByNo(String pst_no) {
		
		return mapper.getListByNo(pst_no);
	}

	@Override
	public int postUpdate(MultipartHttpServletRequest mhr, HttpServletRequest rq) throws Exception {
		
		String repo = "/resources/upload";

		// 서버의 물리경로 얻어오기
		String savePath = rq.getServletContext().getRealPath("") + File.separator + repo;

		System.out.println("세이브패스"+savePath);

		Map map = new HashMap();

		

		// mhr 텍스트파일, 바이너리 파일의 저옵를 모두 얻어올 수 있다.

		Enumeration<String> enu = mhr.getParameterNames();

		// 일반 텍스트 파일의 파라미터명(key), 해당 key의 value값을 가져오기
		while (enu.hasMoreElements()) {

			String paramName = enu.nextElement();
			String paramValue = mhr.getParameter(paramName);

			System.out.println(paramName);
			System.out.println(paramValue);

			map.put(paramName, paramValue);
			

		}
		


		// 파일
		Iterator<String> iter = mhr.getFileNames();

//		List<String> main_img = new ArrayList<String>();
		String pst_img = null;

		while (iter.hasNext()) {

			String fileParamName = iter.next();

			System.out.println("file=" + fileParamName);
			
			
			MultipartFile mFile = mhr.getFile(fileParamName);

			String originName = mFile.getOriginalFilename();

			System.out.println(originName);
			
			if(originName==null || originName.trim()==""){
			
			
				originName = (String)map.get("imgOld");
				
				
				
			}// 널일경우
			
					

			File file = new File(savePath + "\\" + fileParamName);

			if (mFile.getSize() != 0) { // 업로드 된 경우
				if (!file.exists()) {// 파일이 존재하지 않는경우 (!) // exists는 존재하면 true를 리턴
					if (file.getParentFile().mkdir()) { // savePath에 지정된 폴더(fileRepo) 생성
						file.createNewFile(); // 임시파일 생성
					}
				} // if 파일이 존재하지않는경우
				
				File uploadFile = new File(savePath + "\\" + originName);

				// 이미지 이름 중복 시 이미지 이름 대체
				if (uploadFile.exists()) {
					originName = System.currentTimeMillis() + "_" + originName;
					uploadFile = new File(savePath + "\\" + originName);

				}

				// 실제파일 업로드하기
				mFile.transferTo(uploadFile);
//				main_img.add(originName);
				pst_img=originName;
				
			} // if 업로드 된 경우
			else { // 안된경우 원래 이미지 였던걸로 바꾸기
			
				pst_img=originName;
			}
			
			
		} // while

		map.put("pst_img", pst_img);
		
		int n = mapper.postUpdate(map);
		
		return n;
	}

	@Override
	public void postDelete(String pst_no) {
			
		mapper.postDelete(pst_no);
	}

}
