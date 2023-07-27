package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.ChallengeDTO;
import com.smart.home.dto.ChallengeDetailDTO;
import com.smart.home.dto.ChallengeListDTO;

public interface ChallengeService {
	
	// 로그인 사용자의 모든 챌린지 조회(챌린지 달성률, 챌린지명, 챌린지 파일명, 챌린지 내용, 챌린지 성공여부)
	public List<ChallengeListDTO> getAllChallenges(String memberId);
	
	// 회원아이디, 회원등급, 챌린지 달성횟수 조회
	public ChallengeDetailDTO getChallengeDetail(String memberId);
	
	
}
