package ezen.team.mapper.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.PageDTO;
import ezen.team.domain.PostDTO;

@Mapper
public interface PostMapper {

	void postRegister(Map map); // 공지 등록

	List<PostDTO> getList(PageDTO pagedto); // 공지/팝업 리스트 
	int totalCnt(PageDTO pagedto);

	PostDTO getListByNo(String pst_no); // 공지/팝업 번호별 정보

	int postUpdate(Map map);

	void postDelete(String pst_no);

}
