package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.ChallengeDTO;
import com.smart.home.dto.MemberAchievementDTO;

public interface MemberAchievementDAO {
    // 달성률 조회
	List<ChallengeDTO> getAchievementRate(ChallengeDTO cDTO);
	
	// 달성 횟수 조회
	int getAchievementCnt(String memberId);
	
	// 회원 등급 조회 
	String getGrade(String memberId);
	
	
	// 달성률 업데이트(특정 조건에서 트리거가 작동할 때 자동으로 업데이트) 	
	
	// 달성률 삭제
}
