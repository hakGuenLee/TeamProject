package ezen.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.QnaDTO;
import ezen.team.mapper.UserQnAMapper;

@Service
public class UserQnAServiceImpl implements UserQnAService {

	@Autowired
	private UserQnAMapper mapper;
	
	@Override
	public void QnaRegister(QnaDTO qnaDTO) {
		
		mapper.QnaRegister(qnaDTO);
		
	}

}
