package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.ChallengesDAO;
import com.smart.home.dto.ChallengesDTO;
import com.smart.home.dto.ChallengesPagingDTO;

@Service
public class ChallengesServicesImpl implements ChallengesService {

	@Autowired
	ChallengesDAO dao;

	@Override
	public List<ChallengesDTO> ChallengesList(ChallengesPagingDTO pDTO) {
		return dao.ChallengesList(pDTO);
	}

	@Override
	public int ChallengesTotalRecord(ChallengesPagingDTO pDTO) {
		return dao.ChallengesTotalRecord(pDTO);
	}

	@Override
	public List<ChallengesDTO> ChallengesListMore(ChallengesPagingDTO pDTO) {
		return dao.ChallengesListMore(pDTO);
	}

	@Override
	public int ChallengeInsert(ChallengesDTO dto) {
		return dao.ChallengeInsert(dto);
	}

	@Override
	public ChallengesDTO ChallengeSelect(int chalNo) {
		return dao.ChallengeSelect(chalNo);
	}

	@Override
	public String ChallengeFileSelect(int chalNo) {
		return dao.ChallengeFileSelect(chalNo);
	}

	@Override
	public int ChallengeUpdate(ChallengesDTO dto) {
		return dao.ChallengeUpdate(dto);
	}

	@Override
	public int ChallengeDelete(int chalNo) {
		return dao.ChallengeDelete(chalNo);
	}

	@Override
	public int ChallengePartCheck(int chalNo, String logId) {
		return dao.ChallengePartCheck(chalNo, logId);
	}

	@Override
	public int ChallengePart(int chalNo, String logId) {
		return dao.ChallengePart(chalNo, logId);
	}

	@Override
	public void UpdateFeePartCnt(int chalNo) {
		dao.UpdateFeePartCnt(chalNo);
		
	}

	@Override
	public int GetParticipantsCnt(int chalNo) {
		return dao.GetParticipantsCnt(chalNo);
	}

	@Override
	public int GetDeposit(String logId) {
		return dao.GetDeposit(logId);
	}

	@Override
	public void UpdateDeposit(String logId, int memDeposit) {
		dao.UpdateDeposit(logId, memDeposit);
		
	}

	

}
