package com.frontline.newssummary.dao;

import java.util.List;

import com.frontline.newssummary.vo.WordCloudVO;

public interface WordCloudDAO {
	List<WordCloudVO> getWordCloud ();
}
