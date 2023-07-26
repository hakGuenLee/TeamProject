package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CommonCodeDTO;

@Mapper
public interface CommonCodeMapper {

	//공통코드 가져오기
	List<CommonCodeDTO> getCode(String code);

}
