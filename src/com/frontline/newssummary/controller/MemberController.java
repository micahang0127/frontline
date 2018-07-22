package com.frontline.newssummary.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	
	//회원가입
	@RequestMapping("register")
	String registerIndex() {
		return "register";
	}
	
	//헤더파일만 불러오고싶을때
	@RequestMapping("navigation")
	String navigation() {
		return "navigation";
	}
	
	//테스트파일.지워도됨.
	@RequestMapping("ListTest")
	String rollingtestIndex() {
		return "ListTest";
	}
	
	// 아이디/ 비밀번호 찾기
	@RequestMapping("findLogin")
	String findLoginIndex(){
		return "findLogin";
	}
	
	//아이디 체크확인 화면
	@RequestMapping("findLogin_check")
	String findLogin_checkIndex(){
		return "findLogin_check";
	}
	
			
	@RequestMapping("join.do")
	String showjoin() {
		return "join";
	}
	
	@RequestMapping("findLogin.do")
	String showfindLogin() {
		return "findLogin";
	}
	
	//로그인 click
	@RequestMapping("loginForm")
	String gettingMember(MemberVO vo, HttpSession session) {
		System.out.println("진입"+vo.getId());
		if(memberService.getMember(vo) !=null){
			if(memberService.getMember(vo).getId().equals(vo.getId())) {
				System.out.println("있어!");
				session.setAttribute("LoginId", vo.getId());
			}

		}
		else{
			System.out.println("아이디없어");
			return "login_fail";
		}
	
		return "redirect:index";
	}
	
	@RequestMapping("logout")
	String logout(){
		System.out.println("로그아웃 controller 진입");
		return "logout";
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
