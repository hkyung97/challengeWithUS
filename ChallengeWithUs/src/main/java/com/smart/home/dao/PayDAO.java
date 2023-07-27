package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.PayDTO;

public interface PayDAO {

	int GetDeposit(String memberId);
	
	void DepositInsert(PayDTO dto);
	
	List<PayDTO> GetPayList(String memberId);
	
	void MemberDepositUpdate(PayDTO dto);
}
