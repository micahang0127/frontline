package com.frontline.newssummary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.frontline.newssummary.Service.MemberService;
import com.frontline.newssummary.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("index.do")
	String showIndex() {
		return "index";
	}
	
	@RequestMapping("login.do")
	String showlogin() {
		return "logins";
	}
	
	@RequestMapping("join.do")
	String showjoin() {
		return "join";
	}
	
	@RequestMapping("findLogin.do")
	String showfindLogin() {
		return "findLogin";
	}
	
	@RequestMapping("loginForm.do")
	String gettingMember(MemberVO vo) {
		System.out.println("진입"+vo.getId());
		if(memberService.getMember(vo).getId().equals(vo.getId())) {
			System.out.println("있어!");
		}
		return "logins";
	}
	
}
