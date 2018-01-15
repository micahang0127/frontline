package com.frontline.newssummary.vo;

import java.sql.Date;

public class MainSummaryListVO {
private int id;
private int art_oid;
private int art_aid;
private String userid;
private String content;
private int like;
private int hate;
private Date time;
private int popularSid;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getArt_oid() {
	return art_oid;
}
public void setArt_oid(int art_oid) {
	this.art_oid = art_oid;
}
public int getArt_aid() {
	return art_aid;
}
public void setArt_aid(int art_aid) {
	this.art_aid = art_aid;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getLike() {
	return like;
}
public void setLike(int like) {
	this.like = like;
}
public int getHate() {
	return hate;
}
public void setHate(int hate) {
	this.hate = hate;
}
public Date getTime() {
	return time;
}
public void setTime(Date time) {
	this.time = time;
}
public int getPopularSid() {
	return popularSid;
}
public void setPopularSid(int popularSid) {
	this.popularSid = popularSid;
}



}
