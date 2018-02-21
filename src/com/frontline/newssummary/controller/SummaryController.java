package com.frontline.newssummary.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frontline.newssummary.Service.SummaryService;
import com.frontline.newssummary.vo.LikeHateCheckerVO;
import com.frontline.newssummary.vo.SummaryVO;

@Controller
public class SummaryController {

	@Inject
	SummaryService summaryService;

	@RequestMapping("likeHateTest")
	String likeHateTest(SummaryVO svo, LikeHateCheckerVO LHCheckerVO, HttpServletRequest request) {

		int sid = 7;
		SummaryVO SummarySelect = summaryService.SummarySelect(sid);
		if (SummarySelect != null) {
			request.setAttribute("SummarySelect", SummarySelect);
		}
		return "likeHateTest";
	}

	@RequestMapping("clickLike")
	@ResponseBody
	int clickLike(LikeHateCheckerVO LHCheckerVO) {
		System.out.println("좋아요 눌렸어요!");
		System.out.println("비동기로 받은것들 : " + LHCheckerVO.getId() + ", " + LHCheckerVO.getUserid());
		List<?> test = summaryService.likeHateColumnExistCheck(LHCheckerVO);
		if (test.size() != 0) {
			System.out.println("테스트의 사이즈 : " + test.size());
			if (summaryService.userLikeHateSelect(LHCheckerVO).getLikeChecker() >= 1) {
				System.out.println("이미 좋아요 누른적있음");
				return 0;
			} else {
				System.out.println("좋아요 클릭 안했었음");
				summaryService.LikeCheckerUpdate(LHCheckerVO.getId());
				summaryService.LikeUpdate(LHCheckerVO.getId());

				return 1;
			}
		} else {
			System.out.println("like 칼럼 없음");
			int insertResult = summaryService.likeHateColumnInsert(LHCheckerVO);
			System.out.println("칼럼추가 : " + insertResult);

			if (summaryService.userLikeHateSelect(LHCheckerVO).getLikeChecker() >= 1) {
				System.out.println("이미 좋아요 누른적있음");
				return 0;
			} else {
				System.out.println("좋아요 클릭 안했었음");
				summaryService.LikeCheckerUpdate(LHCheckerVO.getId());
				summaryService.LikeUpdate(LHCheckerVO.getId());
				return 1;
			}
		}
	}

	@RequestMapping("clickHate")
	@ResponseBody
	int clickHate(LikeHateCheckerVO LHCheckerVO) {
		System.out.println("싫어요 눌렸어요!");
		System.out.println("비동기로 받은것들 : " + LHCheckerVO.getId() + ", " + LHCheckerVO.getUserid());
		List<?> test = summaryService.likeHateColumnExistCheck(LHCheckerVO);
		if (test.size() != 0) {
			System.out.println("테스트의 사이즈 : " + test.size());
			if (summaryService.userLikeHateSelect(LHCheckerVO).getHateChecker() >= 1) {
				System.out.println("이미 싫어요 누른적있음");
				return 0;
			} else {
				System.out.println("싫어요 클릭 안했었음");
				summaryService.HateCheckerUpdate(LHCheckerVO.getId());
				summaryService.HateUpdate(LHCheckerVO.getId());

				return 1;
			}
		} else {
			System.out.println("Hate 칼럼 없음");
			int insertResult = summaryService.likeHateColumnInsert(LHCheckerVO);
			System.out.println("칼럼추가 : " + insertResult);

			if (summaryService.userLikeHateSelect(LHCheckerVO).getHateChecker() >= 1) {
				System.out.println("이미 싫어요 누른적있음");
				return 0;
			} else {
				System.out.println("싫어요 클릭 안했었음");
				summaryService.HateCheckerUpdate(LHCheckerVO.getId());
				summaryService.HateUpdate(LHCheckerVO.getId());
				return 1;
			}
		}
	}
}