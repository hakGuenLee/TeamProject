package ezen.team.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.mapper.admin.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper mapper;

}
