package com.frontline.newssummary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frontline.newssummary.vo.MemberVO;

@Controller
public class SampleContoroller5 {

	@RequestMapping("/doJSON")
	public @ResponseBody MemberVO doJSON() {
		MemberVO vo = new MemberVO();
		vo.setId("아이디");
		return vo;
	}
}
