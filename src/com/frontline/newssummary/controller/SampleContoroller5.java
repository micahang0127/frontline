package com.frontline.newssummary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frontline.newssummary.vo.ProductVO;

@Controller
public class SampleContoroller5 {

	@RequestMapping("/doJSON.do")
	public @ResponseBody ProductVO doJSON() {
		ProductVO vo = new ProductVO("샘플상품",10000);
		return vo;//ss
	}
}
