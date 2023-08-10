package ezen.team.service.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
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

import ezen.team.domain.FileHandler;
import ezen.team.domain.PageDTO;
import ezen.team.domain.ProductDTO;
import ezen.team.mapper.admin.ProductMapper;

//ProductController와 연결


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private FileHandler fileHandler;
	
	//상품 등록
	@Override
	public void prodRegister(MultipartHttpServletRequest mhr, HttpServletRequest rq) throws Exception {
		
		Map map = new HashMap();	 
		
		map = fileHandler.fileUpload(mhr, rq);
		
		mapper.prodRegister(map);
		
	}
	
	//상품 수정 완료처리
	@Override
	public void prodUpdate(MultipartHttpServletRequest mhr, HttpServletRequest rq) throws Exception {

		Map map = new HashMap();
		map = fileHandler.productUpdate(mhr, rq);
		
		mapper.prodUpdate(map);
	}
	
	
	

	//상품 리스트
	@Override
	public List<ProductDTO> prodList(PageDTO pagedto) {

		int totalCnt = mapper.totalCnt(pagedto);
		
		pagedto.setValue(totalCnt, pagedto.getCntPerPage());
		
		return mapper.prodList(pagedto);
	}
	
	//상품 상세보기 정보
	@Override
	public ProductDTO prodListByNo(String no) {
		
		return mapper.getListByNo(no);
	}
	


	
	
	// 상품 삭제
	@Override
	public void prodDelete(String no, HttpServletRequest request) {
		
		//업로드 폴더에서 삭제할 이미지의 정보를 가져오기 위한 상품 정보 얻기
		ProductDTO pDto = mapper.getProdInfo(no);
		String mainImg = pDto.getMain_img();
		
		String subImg = pDto.getSub_img1();
		String subImg2 = pDto.getSub_img2();
		String detailImg = pDto.getDetail_img();
		
		String repo = "/resources/upload/";

		// 서버의 물리경로 얻어오기
		String savePath = request.getServletContext().getRealPath("") + File.separator + repo;


		System.out.println("삭제할 파일 메인 : " + mainImg);
		
		File file = new File(savePath + mainImg);
		File file2 = new File(savePath + subImg);
		File file3 = new File(savePath + subImg2);
		File file4 = new File(savePath + detailImg);

			
		System.gc();
		System.runFinalization();
		
		 	file.delete();
		 	file2.delete();
		 	file3.delete();
			file4.delete();

		
		mapper.prodDelete(no);
	}
		
	

	

}
