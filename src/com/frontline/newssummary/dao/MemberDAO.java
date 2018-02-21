package com.frontline.newssummary.dao;

import java.util.List;
import java.util.Map;

import com.frontline.newssummary.vo.MemberVO;


public interface MemberDAO {
	List<MemberVO> getMemberList (Map map)  ;
	MemberVO getMember  (MemberVO vo)   ;
	int insertMember (MemberVO vo)  ;  
}
