package com.frontline.newssummary.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frontline.newssummary.Service.RollingNewsService;
import com.frontline.newssummary.Service.SummaryService;
import com.frontline.newssummary.vo.MemberVO;
import com.frontline.newssummary.vo.RollingNewsVO;
import com.frontline.newssummary.vo.SummaryListVO;
import com.frontline.newssummary.vo.SummaryVO;

@Controller
public class SummaryPageController {

	@Inject
	RollingNewsService rollingNewsService;
	
	@Inject
	SummaryService summaryService;
	
	@RequestMapping("summaryPage")
	String contact(RollingNewsVO vo, HttpServletRequest request, SummaryVO summaryVO, SummaryListVO slvo) {
//		System.out.println("aid : "+ slvo.getAid() + ", oid : "+ slvo.getOid());
//		System.out.println("title : "+slvo.getTitle());
		System.out.println("img : "+slvo.getImg());
//		System.out.println("Content : "+slvo.getContent());
		summaryVO.setArt_aid(slvo.getAid());
		summaryVO.setArt_oid(slvo.getOid());
		
		System.out.println("summaryVO aid is " + summaryVO.getArt_aid());
		System.out.println("summaryVO oid is " + summaryVO.getArt_oid());
		
		List<SummaryVO> summaryCollect = summaryService.SummaryCollect(summaryVO);
		if(summaryCollect !=null) {
			System.out.println(summaryCollect.size());
			request.setAttribute("summaryCollect", summaryCollect);
		}
		
		request.setAttribute("selectedSummary", slvo);
		
		
		List<RollingNewsVO> rollingNewsList  = rollingNewsService.rollingTestList(vo);
		if(rollingNewsList !=null) {
			request.setAttribute("rollingNewsList", rollingNewsList);
		}
		
		
		return "summaryPage";
	}
	
	@RequestMapping("reply/save")
	@ResponseBody int userSummaryInsert(SummaryVO vo) {
		System.out.println("입력한 aid체크 : " + vo.getArt_aid());
		System.out.println("입력한 oid체크 : " + vo.getArt_oid());
		System.out.println("id체크 : " + vo.getUserid());
		System.out.println("내용체크 : " + vo.getContent());
		System.out.println("받은 비번체크 : " + vo.getReply_password());
		System.out.println("받은 부모 아이디 체크 : " + vo.getParent_id());
		System.out.println("받은 깊이 체크 : " + vo.getDepth());
		
		if(vo.getUserid() != null && vo.getUserid() != "") {
			int userSummaryInsert = summaryService.userSummaryInsert(vo);
			System.out.println("userSummaryInsert : "+ userSummaryInsert);
			if(userSummaryInsert == 1) {
				System.out.println("리턴1");
				return 1;
				
			}else {
				System.out.println("리턴0");
				return 0;
			}
		}
		
		return 0;
	}
	
	
}
