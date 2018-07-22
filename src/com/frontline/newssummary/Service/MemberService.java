package com.frontline.newssummary.Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frontline.newssummary.dao.MemberDAO;
import com.frontline.newssummary.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
    SqlSessionTemplate sqlSession;
	
	public List<MemberVO> getMemberList (Map map){
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.getMemberList(map);
	}
	
	public MemberVO getMember (MemberVO vo) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.getMember(vo);
	}
	
	public int insertMember (MemberVO vo) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.insertMember(vo);
	}
}
