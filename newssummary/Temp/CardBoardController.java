package com.frontline.newssummary.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.frontline.newssummary.Service.CardBoardService;
import com.frontline.newssummary.vo.MainSummaryListVO;

@Controller
public class CardBoardController {

	
	@Inject
	CardBoardService cardBoardService;
	
	@RequestMapping("index")
	String showIndex(MainSummaryListVO msvo, HttpServletRequest request) {
		List<MainSummaryListVO> MainSummarylist = cardBoardService.getMainSummaryList(msvo);
		if(MainSummarylist !=null) {
			request.setAttribute("list", MainSummarylist);
		}
		return"index";
	}
}
