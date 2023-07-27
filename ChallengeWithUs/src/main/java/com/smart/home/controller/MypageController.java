package com.smart.home.controller;

import com.smart.home.dto.ChallengeDTO;


import com.smart.home.dto.ChallengeDetailDTO;
import com.smart.home.dto.ChallengeListDTO;
import com.smart.home.dto.DepositDTO;
import com.smart.home.dto.MemberAchievementDTO;
import com.smart.home.dto.MemberDTO;
//import com.smart.home.dto.MemberGradeDTO;
import com.smart.home.dto.QaDTO;

import lombok.Data;

import com.smart.home.service.BoardService;
import com.smart.home.service.ChallengeService;
import com.smart.home.service.DepositService;
import com.smart.home.service.MemberAchievementService;
import com.smart.home.service.MemberAchievementServiceImpl;
//import com.smart.home.service.MemberGradeServiceImpl;
import com.smart.home.service.MemberService;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/myPage")
public class MypageController {

    @Autowired
    private ChallengeService Chalservice;
    
    @Autowired
    private MemberService Memservice;
    
    @Autowired
    private DepositService Deposervice;
    
    @Autowired
    private MemberAchievementService MemAchiservice;
    
    @Autowired
    private BoardService Boservice;
    
    // 세션에서 ID 받아오는 메소드 따로 정의
    // gmifs = Get Member Id From Session
    private String gmifs(HttpServletRequest request) {
    	return (String) request.getSession().getAttribute("logId");
    }

    // 나의 챌린지 페이지로 이동
    
    @GetMapping("/myChallenge")
    public ModelAndView myChallenges(HttpServletRequest request) {
        
    	// 1. 로그인 사용자의 아이디 (세션에서 받아오므로 따로 받아올 필요가 없다.)
    	String memberId = gmifs(request);
        
        
        // 2. 로그인 사용자가 참가했던, 모든 챌린지에 대한 총 달성횟수와 회원등급 (DetailDTO로 페이지에 필요한 것들만 넣어서 받아온다.)
        int myAchievementCnt = MemAchiservice.getmyAchievementCnt(memberId);
        String myGrade = MemAchiservice.getmyGrade(memberId);
    
        // 3. 로그인 사용자의 참가 중인 모든 챌린지
        //(필요한 것들만 담은 DTO로 생성 : chalTitle,chalContent, ChalStatus, achievementRate..) 
        // 리스트 형식으로 받아온다. 
        List<ChallengeListDTO> myChallenges = Chalservice.getAllChallenges(memberId);
        
        // Model And View
        ModelAndView mav = new ModelAndView();
        
        // 3. <나의 챌린지>에 보여질 로그인 사용자의 아이디, 달성 횟수, 회원등급
        mav.addObject("memberId", memberId); // 로그인 사용자의 아이디
        mav.addObject("myAchievementsCnt", myAchievementCnt); // 달성 횟수
        mav.addObject("myGrade", myGrade); // 회원등급
   
        // 3. 챌린지 리스트 (달성률, 챌린지명, 챌린지 파일명, 챌린지 컨텐츠, 챌린지 성공 여부)를 Model And View에 추가
        mav.addObject("myChallenges", myChallenges); 
        
        
        
        mav.setViewName("Mypage/Mychallenge");
        return mav;
    }

    // 예치금 관리 페이지로 이동
    @GetMapping("/myDeposit")
    public ModelAndView getMyDeposit(HttpServletRequest request) {
    	
    	// 1. 로그인 사용자의 아이디 (세션에서 받아오므로 따로 받아올 필요가 없다.)
    	String memberId = gmifs(request);;
    	
    	// 2. 로그인 사용자의 예치금에 관한 정보와 예치금 내역을 받아온다.
    	int myDepositBalance = Deposervice.getmyBalance(memberId);
    	List<DepositDTO> myDepositTransactions = Deposervice.getMyDepositTransactions(memberId);
    	
    	// Model And view
    	ModelAndView mav = new ModelAndView();
    	
    	// 3. <예치금 관리>에 보여질 로그인 사용자의 아이디, 총 예치금, 충전하기(버튼)
    	mav.addObject("memberId", memberId); // 로그인 사용자의 아이디
    	mav.addObject("myDepositBalance",myDepositBalance); // 예치금 잔액
    	
    	// 3. <예치금 내역>에 보여질 예치금 번호, 예치금 내용, 금액 을 Model And View에 추가
    	mav.addObject("myDepositTransactions", myDepositTransactions);
    	
    	
    	
    	mav.setViewName("Mypage/Mydeposit");
    	
        return mav;
    }
    
   
    // 회원 정보 수정 페이지로 이동
    @PatchMapping("/myInfo")
    public ModelAndView updateMyMemberInfo(@RequestBody MemberDTO member, HttpServletRequest request) {
        // 로그인 사용자의 아이디 (세션에서 받아오므로 따로 받아올 필요가 없다.)
    	String memberId = gmifs(request);
    	member.setMemberId(memberId);

        // 로그인 사용자의 정보를 업데이트한다. 
        Memservice.memberUpdate(member);
        
        // Model And View
        ModelAndView mav = new ModelAndView();
        
        // 회원 정보를 Model And View에 추가
        mav.addObject("member", member);
        
        mav.setViewName("Mypage/MyInfo");
        
        return mav;
    }

        

    
//    
//    // 고객 문의 페이지로 이동 
//    @GetMapping("/Qa")
//    public ModelAndView getQaBoard(HttpServletRequest request) {
//    	// 1. 로그인 사용자의 아이디 (세션에서 받아오므로 따로 받아올 필요가 없다.)
//    	String memberId = gmifs(request);;
//        
//        // 2. 로그인 사용자의 문의 내역을 받아옵니다.
//        List<QaDTO> myQaList = Boservice.getMyQaList(memberId);
//        
//        // Model And view
//        ModelAndView mav = new ModelAndView();
//        
//        // 3. <고객 문의 게시판>에 보여질 QaNO, QaTitle, memberId, QaDate, QaHit
//        mav.addObject("memberId", memberId); // 로그인 사용자의 아이디
//        mav.addObject("myQaList", myQaList); // 문의 내역 리스트
//        
//        mav.setViewName("Mypage/Qa");
//        return mav;
//    }
}
