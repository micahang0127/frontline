package com.frontline.newssummary.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.frontline.newssummary.Service.MemberService;
import com.frontline.newssummary.vo.MemberVO;

@Controller
public class MemberController {

	@Inject
	MemberService memberService;
	
	@RequestMapping("index")
	String showIndex() {
		return "index";
	}
	
	@RequestMapping("chatTest")
	String chatIndex() {
		return "chatTest";
	}
	
	@RequestMapping("login")
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
