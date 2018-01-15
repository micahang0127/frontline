package com.frontline.newssummary.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.frontline.newssummary.Service.MemberService;
import com.frontline.newssummary.vo.MemberVO;

@Controller
public class MemberController {

	@Inject
	MemberService memberService;
	
	@RequestMapping("index")
	String indexIndex() {
		return "index";
	}
	
	
	@RequestMapping("chatTest")
	String chatIndex() {
		return "chatTest";
	}
	
	@RequestMapping("broadcasting")
	String chat2Index() {
		return "broadcasting";
	}
	
	@RequestMapping("login")
	String showlogin() {
		return "logins";
	}
	
	@RequestMapping("wordcloud")
	String showWordCloud() {
		return "wordcloud";
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
	String gettingMember(MemberVO vo, Model model) {
		model.addAttribute("login",memberService.getMember(vo)) ; 
		System.out.println("진입"+vo.getId());
		if(memberService.getMember(vo).getId().equals(vo.getId())) {
			System.out.println("있어!");
		}
		
		
		return "broadcasting";
	}
	
}
