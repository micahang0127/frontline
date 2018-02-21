package com.frontline.newssummary.vo;

import java.sql.Date;

public class UserSummaryVO extends SummaryVO {
private int id;
private String userid;
private String content;
private int likes;
private int hate;
private Date time;
private int groupId;
private int parentReplyId;
private int depth;
private int orderNumber;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public int getGroupId() {
	return groupId;
}
public void setGroupId(int groupId) {
	this.groupId = groupId;
}
public int getParentReplyId() {
	return parentReplyId;
}
public void setParentReplyId(int parentReplyId) {
	this.parentReplyId = parentReplyId;
}
public int getDepth() {
	return depth;
}
public void setDepth(int depth) {
	this.depth = depth;
}
public int getOrderNumber() {
	return orderNumber;
}
public void setOrderNumber(int orderNumber) {
	this.orderNumber = orderNumber;
}


}
