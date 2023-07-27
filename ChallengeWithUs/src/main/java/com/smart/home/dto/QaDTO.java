package com.smart.home.dto;

import java.util.Date;

import lombok.Data;
@Data
public class QaDTO {
	// QA글번호
	private int qaNo; 
	
	// QA글제목
    private String qaTitle; 
    
    // QA내용
    private String qaContent; 
    
    // 회원아이디
    private String memberId; 
    
    // QA작성일
    private Date qaDate; 
    
    // QA조회수
    private int qaHit; 

}
