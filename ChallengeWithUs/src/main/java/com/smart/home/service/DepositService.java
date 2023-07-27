package com.smart.home.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.smart.home.dto.DepositDTO;


public interface DepositService {
	
	// 예치금 잔액 조회
	public int getmyBalance(String memberId);
	
	// 예치금 내역 조회 
	public List<DepositDTO> getMyDepositTransactions(String memberId);
}
