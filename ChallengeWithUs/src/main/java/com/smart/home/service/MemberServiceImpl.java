package com.smart.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.MemberDAO;
import com.smart.home.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	@Override
	public int MemberInsert(MemberDTO dto) {
		return dao.MemberInsert(dto);
	}

	@Override
	public MemberDTO loginOk(String MemberId, String MemberPwd) {
		return dao.loginOk(MemberId, MemberPwd);
	}
	
	@Override
	public String dupChk(String id) {
		return dao.dupChk(id);
	}

	@Override
	public String findId(String memberName, String memberEmail) {
		return dao.findId(memberName, memberEmail);
	}

	@Override
	public String findPwd(String memberId, String memberEmail) {
		return dao.findPwd(memberId, memberEmail);
	}

	@Override
	public MemberDTO getMember(String logId) {
		return dao.getMember(logId);
	}

	@Override
	public int memberUpdate(MemberDTO dto) {
		return dao.memberUpdate(dto);
	}
	
}


