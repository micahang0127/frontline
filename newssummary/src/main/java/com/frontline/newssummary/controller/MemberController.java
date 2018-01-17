package com.frontline.newssummary.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("register")
	String registerIndex() {
		return "register";
	}
	
	@RequestMapping("contact")
	String cotIndex() {
		return "contact";
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
	
	@RequestMapping("loginForm")
	String gettingMember(MemberVO vo, Model model) {
		model.addAttribute("login",memberService.getMember(vo)) ; 
		System.out.println("진입"+vo.getId());
		if(memberService.getMember(vo).getId().equals(vo.getId())) {
			System.out.println("있어!");
		}
		return "broadcasting";
	}
	
	@RequestMapping("checkUser")
	@ResponseBody int checkUser(MemberVO vo) {
		System.out.println("입력한 아이디체크 : " + vo.getId());
		if(memberService.getMember(vo) != null) {
			if(memberService.getMember(vo).getId().equals(vo.getId())) {
				System.out.println("중복되는 아이디있음");
				return 0;
			}
		}
			System.out.println("중복되는 아이디 없음");
			return 1;
	}
	
	
	@RequestMapping("userRegister")
	@ResponseBody int userRegister(MemberVO vo) {
		System.out.println("전달받은거 체크"+vo.getId() + vo.getPw() + vo.getEmail());
		int success = memberService.insertMember(vo);
		System.out.println("새 유저 등록 아이디: " + vo.getId()+ ", success : " + success );
		return success;
		
	}
	
}
