package com.smart.home.dto;
import lombok.Data;
import java.util.Date;

@Data
public class ChallengeDTO {
	// 챌린지번호
	private int chalNo; 
	
	// 회원아이디
	private String memberId; 
	
	// 챌린지제목
    private String chalTitle;
    
    // 챌린지내용
    private String chalContent; 
    
    // 챌린지참가자수
    private int  participantsCnt; 
    
    // 챌린지참가비
    private int  chalFee; 
    
    // 챌린지총참가비
    private int  chalTotalFee; 
    
    // 챌린지시작일
    private String chalStartDate; 
    
    // 챌린지종료일
    private String chalEndDate; 
    
    // 챌린지활성화여부
    private String chalStatus; 
    
    // 85%이상100%미만달성자수
    private int successParticipants85; 
    
    // 100%달성자수
    private int successParticipants100; 
}

