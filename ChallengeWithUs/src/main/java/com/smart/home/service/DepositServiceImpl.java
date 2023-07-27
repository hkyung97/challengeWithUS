package com.smart.home.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.smart.home.dto.DepositDTO;

@Service
public class DepositServiceImpl implements DepositService{

	@Override
	public int getmyBalance(String memberId) {
		return 0;
	}

	@Override
	public List<DepositDTO> getMyDepositTransactions(String memberId) {
		return null;
	}

}
