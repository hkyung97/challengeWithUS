package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.ChallengeReplyDAO;
import com.smart.home.dto.ChallengeReplyDTO;

@Service
public class ChallengeReplyServiceImpl implements ChallengeReplyService {

	@Autowired
	ChallengeReplyDAO dao;

	@Override
	public int ChallengeReplyInsert(ChallengeReplyDTO dto) {
		return dao.ChallengeReplyInsert(dto);	}

	@Override
	public List<ChallengeReplyDTO> ChallengeReplyList(int chalNo) {
		return dao.ChallengeReplyList(chalNo);
	}

	@Override
	public int ChallengeReplyEditOk(ChallengeReplyDTO dto) {
		return dao.ChallengeReplyEditOk(dto);
	}

	@Override
	public int ChallengeReplyDel(int chalNo) {
		return dao.ChallengeReplyDel(chalNo);
	}
	


}
