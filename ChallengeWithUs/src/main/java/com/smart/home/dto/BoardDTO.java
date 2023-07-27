package com.smart.home.dto;

import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	private int qaNo;
	private String qaTitle;
	private String qaContent;
	private String memberId;
	private String qaDate;
	private int qaHit;
	//삭제된 파일명
	private List<String> delFile;
	
}

