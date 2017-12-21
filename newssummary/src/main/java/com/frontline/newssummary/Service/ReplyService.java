package com.frontline.newssummary.Service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.dao.ReplyDAO;
import com.frontline.newssummary.vo.ReplyVO;

@Service
public class ReplyService {

	@Inject
	SqlSessionTemplate sqlSession;
	
	public List<ReplyVO> replyList (Integer sid){
		ReplyDAO dao = sqlSession.getMapper(ReplyDAO.class);
		return dao.replyList(sid);
	}
	
	public void create(ReplyVO vo) {
		ReplyDAO dao = sqlSession.getMapper(ReplyDAO.class);
	}
}
