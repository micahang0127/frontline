package com.frontline.newssummary.Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.dao.MainSummaryListDAO;
import com.frontline.newssummary.vo.MainSummaryListVO;

@Service
public class CardBoardService {
	
	@Autowired
    SqlSessionTemplate sqlSession;  
	
	public List<MainSummaryListVO> getMainSummaryList (MainSummaryListVO vo){
		MainSummaryListDAO dao = sqlSession.getMapper(MainSummaryListDAO.class);
		return dao.getMainSummaryList(vo);
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
