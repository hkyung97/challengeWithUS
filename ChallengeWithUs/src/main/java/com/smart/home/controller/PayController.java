package com.smart.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.PayDTO;
import com.smart.home.service.PayService;

@Controller
@RequestMapping("/yj")
public class PayController {

	@Autowired
	PayService service;

	@GetMapping("/PayForm")
	public String PayForm() {
		return "yj/PayForm";
	}

	@PostMapping("/PayRequest")
	@ResponseBody
	public String PayRequest(PayDTO dto, HttpSession session) {
		try {
			int nowMemberDeposit = service.GetDeposit((String)session.getAttribute("logId"));
			nowMemberDeposit += dto.getDepositAmount();
			dto.setMemberId((String)session.getAttribute("logId"));
			service.MemberDepositUpdate(dto);
			dto.setDepositBalance(nowMemberDeposit);
			dto.setDepositContent("예치금 충전");
			service.DepositInsert(dto);
			
			return dto.getMemberId();
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	@PostMapping("PayList")
	public ModelAndView PayList(String memberId) {
		ModelAndView mav = new ModelAndView();
		List<PayDTO> list = null;
		try {
			list = service.GetPayList(memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.setViewName("/yj/PayList");
		return mav;
	}
}
