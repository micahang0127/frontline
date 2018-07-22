package com.frontline.newssummary.Service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.dao.MainSummaryListDAO;
import com.frontline.newssummary.vo.MainSummaryListVO;
import com.frontline.newssummary.vo.SummaryListVO;

@Service
public class CardBoardService {
	
	@Autowired
    SqlSessionTemplate sqlSession;  
	
	public List<MainSummaryListVO> getMainSummaryList (MainSummaryListVO vo){
		MainSummaryListDAO dao = sqlSession.getMapper(MainSummaryListDAO.class);
		return dao.getMainSummaryList(vo);
	}
	
	public List<SummaryListVO> getSubSummaryList (int sid, int pageNoFront, int PageNoBack){
		MainSummaryListDAO dao = sqlSession.getMapper(MainSummaryListDAO.class);
		return dao.getSubSummaryList(sid, pageNoFront, PageNoBack);
	}
	
	public MainSummaryListVO getMainSummary (MainSummaryListVO vo) {
		MainSummaryListDAO dao = sqlSession.getMapper(MainSummaryListDAO.class);
		return dao.getMainSummary(vo);
	}
	
	public MainSummaryListVO insertMember (MainSummaryListVO vo) {
		MainSummaryListDAO dao = sqlSession.getMapper(MainSummaryListDAO.class);
		return dao.insertMainSummary(vo);
	}
}
