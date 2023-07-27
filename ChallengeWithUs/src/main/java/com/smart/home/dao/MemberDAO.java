package com.smart.home.dao;

import com.smart.home.dto.MemberDTO;

public interface MemberDAO {
	public int MemberInsert(MemberDTO dto);

	public MemberDTO loginOk(String MemberId, String MemberPwd);

	public String findId(String memberName, String memberEmail);

	public String dupChk(String memberId);
	
	public String findPwd(String memberId, String memberEmail);
	
	public MemberDTO getMember(String logId);
	
	public int memberUpdate(MemberDTO dto);
}
