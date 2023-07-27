package com.smart.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smart.home.dto.ChallengeReplyDTO;
import com.smart.home.service.ChallengeReplyService;

@Controller
@RequestMapping("/yj")
public class ChallengeReplyController {
	
	@Autowired
	ChallengeReplyService service;
	
	@PostMapping("/ChallengeReplyWrite")
	@ResponseBody
	public String ChallengeReplyWrite(ChallengeReplyDTO dto, HttpSession session) {
		dto.setMemberId((String)session.getAttribute("logId"));
		System.out.println(dto.toString());
		int result = service.ChallengeReplyInsert(dto);
		return result+"";
	}
	
	@GetMapping("/ChallengeReplyList")
	@ResponseBody
	public List<ChallengeReplyDTO> ChallengeReplyList(int chalNo) { // 원글글번호
		return service.ChallengeReplyList(chalNo);

	}
	
	@PostMapping("/ChallengeReplyEditOk")
	@ResponseBody
	public int ChallengeReplyEditOk(ChallengeReplyDTO dto) {
		return service.ChallengeReplyEditOk(dto);
		
	}
	
	@GetMapping("/ChallengeReplyDel")
	@ResponseBody
	public int ChallengeReplyDel(int chalNo) {
		return service.ChallengeReplyDel(chalNo);
	}
}
