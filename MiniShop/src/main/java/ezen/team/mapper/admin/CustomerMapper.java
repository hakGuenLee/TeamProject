package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;
import ezen.team.domain.QnaDTO;

@Mapper
public interface CustomerMapper {

	// 1:1문의 페이징 처리
	int totalCnt(PageDTO pageDto);
	
	//1:1문의 가져오기
	List<CsDTO> csList(String cs_code, String proc_sts, PageDTO pageDto);

	CsDTO csInfo(int cs_no, int proc_sts);
	
	CsDTO itemName(String cs_code);

	void csReply(@Param("cs_no")int cs_no, @Param("csre_con")String csre_con, @Param("proc_id")String proc_id);
	
	

}
