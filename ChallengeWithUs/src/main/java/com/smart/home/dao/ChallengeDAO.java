package com.smart.home.dao;

import java.util.List;


import com.smart.home.dto.ChallengeDTO;


public interface ChallengeDAO {
	//챌린지 등록
	public int registerChal(ChallengeDTO cDTO);
	
	//모든 챌린지 조회
	public List<ChallengeDTO> getAllChallenges();
	
	
}
