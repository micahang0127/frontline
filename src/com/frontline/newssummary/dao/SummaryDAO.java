package com.frontline.newssummary.dao;

import java.util.List;

import com.frontline.newssummary.vo.LikeHateCheckerVO;
import com.frontline.newssummary.vo.SummaryVO;

public interface SummaryDAO {
public List<SummaryVO> SummaryCollect(SummaryVO vo);
public SummaryVO SummarySelect(Integer summaryId);
public LikeHateCheckerVO userLikeHateSelect (LikeHateCheckerVO LHCheckerVO);
public List<?> likeHateColumnExistCheck (LikeHateCheckerVO LHCheckerVO);
public int likeHateColumnInsert (LikeHateCheckerVO LHCheckerVO);
public void SummaryUpdate(SummaryVO vo);
public int LikeUpdate(int summaryId);
public int LikeCheckerUpdate(int summaryId);
public int HateUpdate(int summaryId);
public int HateCheckerUpdate(int summaryId);
public int userSummaryInsert (SummaryVO vo);


}
