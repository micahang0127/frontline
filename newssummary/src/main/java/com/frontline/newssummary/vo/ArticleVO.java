package com.frontline.newssummary.vo;

import java.sql.Date;

public class ArticleVO {
private int oid;
private int aid;
private Date date;
private String url;
private String title;
private String content;
private String img;
private int cnt;

public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public int getAid() {
	return aid;
}
public void setAid(int aid) {
	this.aid = aid;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public int getCnt() {
	return cnt;
}
public void setCnt(int cnt) {
	this.cnt = cnt;
}



}
