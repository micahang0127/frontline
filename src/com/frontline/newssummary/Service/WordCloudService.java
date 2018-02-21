package com.frontline.newssummary.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.SystemPropertyUtils;

import com.frontline.newssummary.dao.ArticleDAO;
import com.frontline.newssummary.dao.WordCloudDAO;
import com.frontline.newssummary.vo.ArticleVO;
import com.frontline.newssummary.vo.WordCloudVO;

@Service
public class WordCloudService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<WordCloudVO> getWordCloud (){
		WordCloudDAO dao = sqlSession.getMapper(WordCloudDAO.class);
		return dao.getWordCloud();
	}

	public List<ArticleVO> findByKeyword(String keyword) {
		ArticleDAO dao = sqlSession.getMapper(ArticleDAO.class);		
		System.out.println("서비스 키워드는 무어냐"+keyword);
		return dao.findByKeyword(keyword);
/*		List<ArticleVO> news_wc = new ArrayList<>();
		news_wc.add(WordCloud_News("http://www.naver.com", "가짜뉴스다", "가짜뉴스에요"));
		news_wc.add(WordCloud_News("http://www.naver.com", "하하하", "나온다!"));
		
		return news_wc;*/
	}

	private ArticleVO WordCloud_News(String url, String title, String content) {
		ArticleVO a = new ArticleVO();
		a.setUrl(url);
		a.setTitle(title);
		a.setContent(content);
		return a;
	}
}
