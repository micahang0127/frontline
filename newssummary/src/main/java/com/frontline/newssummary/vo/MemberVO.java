package com.frontline.newssummary.vo;

public class MemberVO {
String id;
int pw;
String email;
int rank;
int point;
String nickname;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getPw() {
	return pw;
}
public void setPw(int pw) {
	this.pw = pw;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getRank() {
	return rank;
}
public void setRank(int rank) {
	this.rank = rank;
}
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
}
