package com.frontline.newssummary.vo;

import java.sql.Date;

public class SummaryVO {
private int id;
private int art_oid;
private int art_aid;
private String userid;
private String content;
private int likes;
private int hate;
private Date time;
private int reply_password;
private String parent_id;
private int depth;

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
public int getLikes() {
	return likes;
}
public void setLikes(int likes) {
	this.likes = likes;
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
public int getReply_password() {
	return reply_password;
}
public void setReply_password(int reply_password) {
	this.reply_password = reply_password;
}
public String getParent_id() {
	return parent_id;
}
public void setParent_id(String parent_id) {
	this.parent_id = parent_id;
}
public int getDepth() {
	return depth;
}
public void setDepth(int depth) {
	this.depth = depth;
}



}
