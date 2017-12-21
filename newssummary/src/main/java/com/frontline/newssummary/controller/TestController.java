package com.frontline.newssummary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public void ajaxTest() {
		System.out.println("테스트컨트롤러진입");
	}
}
