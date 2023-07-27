package com.smart.home.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smart.home.service.ChallengesService;

@Controller
@RequestMapping("/yj")
public class ChallengesController {
	
	@Autowired
	ChallengesService service;
	
	// 챌린지 리스트 조회
//	@GetMapping("/ChallengesList")
//	public ModelAndView ChallengesList(ChallengesPagingDTO pDTO) {
//
//		pDTO.setTotalRecord(service.ChallengesTotalRecord(pDTO));
//		List<ChallengesDTO> list = service.ChallengesList(pDTO);
//		
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("list", list);
//		mav.addObject("pDTO", pDTO);
//		mav.setViewName("yj/ChallengesList");
//		return mav;
//	}
	

	
	
//	@GetMapping("/ChallengeDelete")
//	@ResponseBody
//	public String ChallengeDelete(HttpServletRequest request,  HttpSession session, int chalNo) {
//		int result = 0;
//		String path = request.getSession().getServletContext().getRealPath("/upload");
//
//		String delFilename = service.ChallengeFileSelect(chalNo);
//		if (delFilename != null) {
//			File delFile = new File(path, delFilename);
//			
//			if (delFile.exists()) {
//				delfile.Delete(path, delFilename);
//			}
//		}
//		
//		try {
//			result = service.ChallengeDelete(chalNo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		if (result > 0) {
//	        return "success";
//	    } else {
//	        return "failure";
//	    }
//	}
//
//
	}













