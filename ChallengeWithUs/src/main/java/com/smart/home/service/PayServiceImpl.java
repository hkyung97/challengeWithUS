package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.PayDAO;
import com.smart.home.dto.PayDTO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	PayDAO dao;

	@Override
	public int GetDeposit(String memberId) {
		return dao.GetDeposit(memberId);
	}

	@Override
	public void DepositInsert(PayDTO dto) {
		dao.DepositInsert(dto);
		
	}

	@Override
	public List<PayDTO> GetPayList(String memberId) {
		return dao.GetPayList(memberId);
	}

	@Override
	public void MemberDepositUpdate(PayDTO dto) {
		dao.MemberDepositUpdate(dto);
		
	}

}
