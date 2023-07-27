package com.smart.home.dto;

import lombok.Data;

@Data
public class DepositDTO {
	private int DepositTransNo;
    private String memberId;
    private int DepositAmount;
    private String DepositPayDate;
    private String DepositContent;
    private int DepositBalance;

}
