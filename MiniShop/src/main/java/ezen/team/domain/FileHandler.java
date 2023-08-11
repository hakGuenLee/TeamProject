package ezen.team.domain;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


//관리자 페이지 상품 등록 시 파일 업로드, 수정 Handler
@Component
public class FileHandler {

	//파일 업로드 메서드
	public Map fileUpload(MultipartHttpServletRequest mhr, HttpServletRequest rquest) throws Exception {
		
		String repo = "/resources/upload";

		// 서버의 물리경로 얻어오기
		String savePath = rquest.getServletContext().getRealPath("") + File.separator + repo;

		System.out.println("savePath : " + savePath);

		Map<String, String> map = new HashMap<>();

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
				
				map.put(fileParamName, originName);

			} // if 업로드 된 경우
		} // while	
		return map;
		
	}
	
	//수정하기 메서드
	public Map productUpdate(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception {
		
		String repo = "/resources/upload";

		// 서버의 물리경로 얻어오기
		String savePath = request.getServletContext().getRealPath("") + File.separator + repo;

		System.out.println("세이브패스"+savePath);

		Map<String, String> map = new HashMap<>();

		// mhr 텍스트파일, 바이너리 파일의 정보를 모두 얻어올 수 있다.
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
		
		
		
		while (iter.hasNext()) {
			
			String originName="";
			MultipartFile mFile = mhr.getFile("");
			String fileParamName = iter.next();

			System.out.println("file=" + fileParamName);
			
			
			// 메인 이미지 수정 안했을 경우
			if(fileParamName.equals("main_img")) {
				
				mFile = mhr.getFile("main_img");
				originName = mFile.getOriginalFilename();
				
				if(originName==null || originName.trim()==""){
					
					originName = (String)map.get("imgOld");
					
				}// 널일경우
			}
			
			// 상세 이미지 수정 안했을 경우 원래꺼로
			if(fileParamName.equals("detail_img")) {
				
				mFile = mhr.getFile("detail_img");
				originName = mFile.getOriginalFilename();
				
				if(originName==null || originName.trim()==""){
					
					originName = (String)map.get("detailOld");
					
				}// 널일경우
			}
			
			// 서브이미지 1 수정 안했을 경우 원래꺼로
			if(fileParamName.equals("sub_img1")) {
				
				mFile = mhr.getFile("sub_img1");
				originName = mFile.getOriginalFilename();
				
				if(originName==null || originName.trim()==""){
					
					originName = (String)map.get("subOld1");
					
				}// 널일경우
			}
			
			//서브이미지 1 수정 안했을 경우 원래꺼로
			if(fileParamName.equals("sub_img2")) {
				
				mFile = mhr.getFile("sub_img2");
				originName = mFile.getOriginalFilename();
				
				if(originName==null || originName.trim()==""){
					
					originName = (String)map.get("subOld2");
					
				}// 널일경우
			}

			
			
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
//				main_img=originName;
				
			} // if 업로드 된 경우
			else { // 안된경우 원래 이미지 였던걸로 바꾸기
			
			}
			
			System.out.println("수정할 이미지이름 ) = " +  originName);
			
			map.put(fileParamName, originName);
			
		} // while
		return map;

	}
	
	
	
}
