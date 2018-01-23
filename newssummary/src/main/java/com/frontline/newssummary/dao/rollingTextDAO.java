package com.frontline.newssummary.dao;

import java.util.List;

import com.frontline.newssummary.vo.weatherVO;
import com.frontline.newssummary.vo.rollingnewsVO;

public interface rollingTextDAO {
public List<weatherVO> weatherList(weatherVO vo);
public List<rollingnewsVO> rollingList(rollingnewsVO vo);
}
