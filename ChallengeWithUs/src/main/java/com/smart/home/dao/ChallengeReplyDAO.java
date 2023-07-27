package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.ChallengeReplyDTO;

public interface ChallengeReplyDAO {

	int ChallengeReplyInsert(ChallengeReplyDTO dto);

	List<ChallengeReplyDTO> ChallengeReplyList(int chalNo);
	
	int ChallengeReplyEditOk(ChallengeReplyDTO dto);
	
	int ChallengeReplyDel(int chalNo);
}
