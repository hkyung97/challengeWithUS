package com.smart.home.dao;

import com.smart.home.dto.QaDTO;
import java.util.List;
//임의 작성 중
public interface QaDAO {
	// 모든 문의글 가져오기
    List<QaDTO> getAllQa();  
    
    // 특정 사용자의 문의글 가져오기
    List<QaDTO> getMyQaList(String memberId);  
    
    // 문의글 작성
    void insertQa(QaDTO qa);  
    
    // 문의글 수정
    void updateQa(QaDTO qa);  
    
    // 문의글 삭제
    void deleteQa(int qaNo);  
}
