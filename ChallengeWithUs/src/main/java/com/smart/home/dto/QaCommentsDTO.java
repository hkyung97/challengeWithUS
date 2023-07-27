package com.smart.home.dto;

import lombok.Data;

@Data
public class QaCommentsDTO {
	private int qacommentNo;
	private int qaNo;
	private String qacommentContent;
	private String qacommentDate;
	private String memberId;
}
