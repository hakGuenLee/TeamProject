package ezen.team.mapper;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.CsDTO;

//BoardServiceImple과 연결

@Mapper
public interface BoardMapper {

	public void csInsert(CsDTO csDto);

}
