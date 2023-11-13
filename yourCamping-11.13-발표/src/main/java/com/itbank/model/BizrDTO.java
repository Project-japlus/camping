package com.itbank.model;


/*
 * USER_IDX NOT NULL NUMBER        
BIZRNO   NOT NULL VARCHAR2(26)  
USERID   NOT NULL VARCHAR2(20)  
USERPW   NOT NULL VARCHAR2(300) 
SALT     NOT NULL VARCHAR2(100) 
USERNAME NOT NULL VARCHAR2(20)  
PHONE    NOT NULL VARCHAR2(20)  
EMAIL    NOT NULL VARCHAR2(50)
 *  
 *  
 *  */
public class BizrDTO {
	private int user_idx;
	private String bizrno;
	private String userid;
	private String userpw;
	private String username;
	private String phone;
	private String email;
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getBizrno() {
		return bizrno;
	}
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
