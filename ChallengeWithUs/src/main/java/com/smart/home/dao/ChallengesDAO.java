package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.ChallengesDTO;
import com.smart.home.dto.ChallengesPagingDTO;

public interface ChallengesDAO {
	public List<ChallengesDTO> ChallengesList(ChallengesPagingDTO pDTO);

	public int ChallengesTotalRecord(ChallengesPagingDTO pDTO);
	
	public List<ChallengesDTO> ChallengesListMore(ChallengesPagingDTO pDTO);

	public int ChallengeInsert(ChallengesDTO dto);
	
	public ChallengesDTO ChallengeSelect(int chalNo);

	public String ChallengeFileSelect(int chalNo);

	public int ChallengeUpdate(ChallengesDTO dto);
	
	public int ChallengeDelete(int chalNo);
	
	public int ChallengePartCheck(int chalNo, String logId);
	
	public int ChallengePart(int chalNo, String logId);
	
	public void UpdateFeePartCnt(int chalNo);
	
	public int GetParticipantsCnt(int chalNo);
	
	public int GetDeposit(String logId);
	
	public void UpdateDeposit(String logId, int memDeposit);

}
