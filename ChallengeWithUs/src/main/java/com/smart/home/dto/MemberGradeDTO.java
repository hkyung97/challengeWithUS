package com.smart.home.dto;

import lombok.Data;

@Data
public class MemberGradeDTO {
	// ȸ������̸�(Basic �Ǵ� Leader)
	private String memberGradeName;
	
	// ȸ����� �󼼼���
    private String memberGradeDesc;
    
    // ȸ����� ����
    private String memberGradeRequirement;
}
