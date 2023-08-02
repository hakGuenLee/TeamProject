package ezen.team.service.admin;

import java.util.List;

import ezen.team.domain.CommonCodeDTO;

public interface CommonCodeService {

	//공통코드 가져오기
	List<CommonCodeDTO> getCode(String code);

}
