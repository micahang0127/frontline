package com.frontline.newssummary.dao;

import java.util.List;

import com.frontline.newssummary.vo.ArticleVO;

public interface ArticleDAO {
	
	List<ArticleVO> findByKeyword(String keyword);
	
}
