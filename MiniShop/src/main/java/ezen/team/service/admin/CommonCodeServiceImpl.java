package ezen.team.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.CommonCodeDTO;
import ezen.team.mapper.admin.CommonCodeMapper;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	CommonCodeMapper mapper;
	
	
	//공통코드 가져오기
	@Override
	public List<CommonCodeDTO> getCode(String code) {
		
		List<CommonCodeDTO> list = mapper.getCode(code);
		
		return list;
	}

}