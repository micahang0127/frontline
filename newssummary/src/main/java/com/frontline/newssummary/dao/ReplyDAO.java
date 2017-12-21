package com.frontline.newssummary.dao;

import java.util.List;

import com.frontline.newssummary.vo.ReplyVO;

public interface ReplyDAO {
public List<ReplyVO> replyList(Integer sid);
public void create(ReplyVO vo);
public void update(ReplyVO vo);
public void delete(ReplyVO vo);
}
