package com.smart.home.dto;

import lombok.Data;

//나의 챌린지 페이지에서 MemberId(회원아이디)를 기준으로 하여 
//MemberGrade(회원등급)과 AchievementCnt(챌린지 달성횟수)를 페이지에서 보여준다.
@Data
public class ChallengeDetailDTO {
    //==회원등급==
    private String memberGrade;
    
    //==챌린지 달성횟수==(챌린지 달성횟수는 챌린지 중 MemberAchievementRate(달성률)이 85% 이상인 것을 달성한 것으로 한다.)
    private int achievement_count;
  
}
