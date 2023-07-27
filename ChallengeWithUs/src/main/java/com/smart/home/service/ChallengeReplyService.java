/**
 * 
 */
package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.ChallengeReplyDTO;

public interface ChallengeReplyService {

	int ChallengeReplyInsert(ChallengeReplyDTO dto);

	List<ChallengeReplyDTO> ChallengeReplyList(int chalNo);

	int ChallengeReplyEditOk(ChallengeReplyDTO dto);

	int ChallengeReplyDel(int chalNo);

}
