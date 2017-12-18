package com.frontline.newssummary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "login";
	}
	
	@RequestMapping("loginForm.do")
	String getMember(MemberVO vo) {
		memberService.getMember(vo);
		return "login";
	}
	
}
