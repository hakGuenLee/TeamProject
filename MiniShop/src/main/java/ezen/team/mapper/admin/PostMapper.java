package ezen.team.mapper.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.PostDTO;

@Mapper
public interface PostMapper {

	void postRegister(Map map);

	List<PostDTO> getList();

}
