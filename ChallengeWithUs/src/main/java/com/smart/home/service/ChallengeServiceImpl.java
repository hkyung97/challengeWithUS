package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.ChallengeDAO;
import com.smart.home.dto.ChallengeDTO;
import com.smart.home.dto.ChallengeDetailDTO;
import com.smart.home.dto.ChallengeListDTO;

@Service
public class ChallengeServiceImpl implements ChallengeService{
	@Autowired
	ChallengeDAO cdao;

	@Override
	public ChallengeDetailDTO getChallengeDetail(String memberId) {
		return null;
	}


	@Override
	public List<ChallengeListDTO> getAllChallenges(String memberId) {
		//  method stub
		return null;
	}

}
