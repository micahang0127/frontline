package com.frontline.newssummary.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.frontline.newssummary.vo.SampleVO;

@RestController
@RequestMapping("/sample.do")
public class SampleController {
	
	@RequestMapping("/hello.do")
	public String sayHello() {
		return "나는 타이어다.";
	}

	@RequestMapping("/sendVO.do")
	public SampleVO sendVO() {
		SampleVO vo = new SampleVO();
		vo.setMno(123);
		vo.setName("각");
		return vo;
	}
}
