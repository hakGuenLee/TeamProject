package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CsDTO;

@Mapper
public interface CustomerMapper {
	
	List<CsDTO> csList(String cs_code, String proc_sts);

}
