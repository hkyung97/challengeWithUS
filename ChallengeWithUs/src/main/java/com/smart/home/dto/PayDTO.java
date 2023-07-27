package com.smart.home.dto;

import lombok.Data;

@Data
public class PayDTO {
	
	private int deposittransNo;
	private String memberId;
	private int depositAmount;
	private int depositBalance;
	private String depositContent;
	private String depositpayDate;
}
