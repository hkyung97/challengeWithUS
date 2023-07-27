package com.smart.home.dto;

import lombok.Data;

@Data
public class ChallengesDTO {
	private int chalNo;
	private String chalTitle;
	private String chalContent;
	private String chalFilename;
	private String memberId;
	private int chalFee;
	private String chalstartDate;
	private String chalendDate;
	private int participantsCnt;
	
	
}
