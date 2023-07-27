package com.smart.home.service;
import java.time.LocalDate;


import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smart.home.dao.MemberAchievementDAO;
import com.smart.home.dto.ChallengeDTO;
import com.smart.home.dto.MemberAchievementDTO;
@Service
public class MemberAchievementServiceImpl implements MemberAchievementService {
	@Autowired
	MemberAchievementDAO mdao;

	@Override
	public List<ChallengeDTO> getMyAchievementsRate(ChallengeDTO cDTO) {
		return mdao.getAchievementRate(cDTO);
	}


	@Override
	public int getmyAchievementCnt(String memberId) {
		return mdao.getAchievementCnt(memberId);
	}


	@Override
	public String getmyGrade(String memberId) {
		return null;
	}

	
}
