package com.smart.home.dao;

import com.smart.home.dto.MemberGradeDTO;

public interface MemberGradeDAO {
	// ȸ�� ��� ��ȸ
    MemberGradeDTO getMemberGrade(String memberId);
    
    // ȸ�� ��� ������Ʈ(��� ������Ʈ�� � Ư���� ����(�޼��� ç���� 10�� �̻����)�� �޼� ��, 
    // �ڵ����� ��� ���׷��̵�(Basic => Leader)
    
    // ȸ�� ��� ����
}
