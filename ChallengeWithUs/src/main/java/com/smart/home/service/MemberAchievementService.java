package com.smart.home.service;


import java.util.List;

import com.smart.home.dto.ChallengeDTO;
import com.smart.home.dto.MemberAchievementDTO;

public interface MemberAchievementService {
	
	//로그인 되어있는 사용자의 달성률을 챌린지 별로 불러오기
	public List<ChallengeDTO> getMyAchievementsRate(ChallengeDTO cDTO);
	
	// 로그인 되어있는 사용자의 챌린지 달성 횟수
	public int getmyAchievementCnt(String memberId);
	
	// 로그인 되어있는 사용자의 회원등급 
	public String getmyGrade(String memberId);

	
}
