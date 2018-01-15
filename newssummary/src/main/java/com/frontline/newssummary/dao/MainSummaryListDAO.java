package com.frontline.newssummary.dao;

import java.util.List;

import com.frontline.newssummary.vo.MainSummaryListVO;


public interface MainSummaryListDAO {
	List<MainSummaryListVO> getMainSummaryList (MainSummaryListVO vo)  ;
	MainSummaryListVO getMainSummary (MainSummaryListVO vo)   ;
	MainSummaryListVO insertMainSummary (MainSummaryListVO vo)  ;  
}
