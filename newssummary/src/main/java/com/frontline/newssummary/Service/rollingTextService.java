package com.frontline.newssummary.Service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.vo.weatherVO;
import com.frontline.newssummary.dao.rollingTextDAO;
import com.frontline.newssummary.vo.rollingnewsVO;

@Service
public class rollingTextService {

	@Inject
	SqlSessionTemplate sqlSession;
	
	public List<weatherVO> weatherList (weatherVO vo){
		rollingTextDAO dao = sqlSession.getMapper(rollingTextDAO.class);
		return dao.weatherList(vo);
	}
	
	public List<rollingnewsVO> weatherList (rollingnewsVO vo){
		rollingTextDAO dao = sqlSession.getMapper(rollingTextDAO.class);
		return dao.rollingList(vo);
	}
	

}
