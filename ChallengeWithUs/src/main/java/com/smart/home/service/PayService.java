package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.PayDTO;

public interface PayService {

	int GetDeposit(String memberId);

	void DepositInsert(PayDTO dto);

	List<PayDTO> GetPayList(String memberId);

	void MemberDepositUpdate(PayDTO dto);

}
