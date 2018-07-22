package com.frontline.newssummary.Service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.dao.rollingNewsDAO;
import com.frontline.newssummary.vo.RollingNewsVO;

@Service
public class RollingNewsService {

	@Inject
	SqlSessionTemplate sqlSession;
	
	public List<RollingNewsVO> rollingTestList (RollingNewsVO vo){
		rollingNewsDAO dao = sqlSession.getMapper(rollingNewsDAO.class);
		return dao.rollingNewsList(vo);
	}
	

	
}
