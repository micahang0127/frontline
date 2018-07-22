package com.frontline.newssummary.Service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.dao.SummaryDAO;
import com.frontline.newssummary.vo.LikeHateCheckerVO;
import com.frontline.newssummary.vo.SummaryVO;

@Service
public class SummaryService {

	@Inject
	SqlSessionTemplate sqlSession;
	
	public List<SummaryVO> SummaryCollect(SummaryVO svo){
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.SummaryCollect(svo);
	}
	
	public SummaryVO SummarySelect (Integer sid){
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.SummarySelect(sid);
	}
	
	public LikeHateCheckerVO userLikeHateSelect (LikeHateCheckerVO LHCheckerVO){
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.userLikeHateSelect(LHCheckerVO);
	}
	
	public int likeHateColumnInsert (LikeHateCheckerVO LHCheckerVO){
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.likeHateColumnInsert(LHCheckerVO);
	}
	
	public List<?> likeHateColumnExistCheck (LikeHateCheckerVO LHCheckerVO){
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.likeHateColumnExistCheck(LHCheckerVO);
	}
	
	public void SummaryUpdate(SummaryVO vo) {
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
	}
	
	public int LikeUpdate(int summaryId) {
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.LikeUpdate(summaryId);
	}
	
	public int LikeCheckerUpdate(int summaryId) {
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.LikeCheckerUpdate(summaryId);
	}
	
	public int HateUpdate(int summaryId) {
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.HateUpdate(summaryId);
	}

	public int HateCheckerUpdate(int summaryId) {
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.HateCheckerUpdate(summaryId);
	}
	
	public int userSummaryInsert(SummaryVO vo) {
		SummaryDAO dao = sqlSession.getMapper(SummaryDAO.class);
		return dao.userSummaryInsert(vo);
	}

}
