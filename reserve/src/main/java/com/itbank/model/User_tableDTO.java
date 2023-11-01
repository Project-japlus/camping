package com.itbank.model;

/* 
 * 이름       널?       유형            
	-------- -------- ------------- 
	USER_IDX NOT NULL NUMBER        
	USERID   NOT NULL VARCHAR2(20)  
	USERPW   NOT NULL VARCHAR2(300) 
	SALT     NOT NULL VARCHAR2(100) 
	USERNAME NOT NULL VARCHAR2(20)  
	ROLE     NOT NULL VARCHAR2(20)  
	PHONE    NOT NULL VARCHAR2(20)  
	EMAIL    NOT NULL VARCHAR2(50)  
 * 
 * */
public class User_tableDTO {
	
	private int user_idx;
	private String userid;
	private String userpw;
	private String salt;
	private String role;
	private String username; //이용자 이름 
	private String phone;	// 연락처
	private String email;  	// 이메일
	
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	
	
	
}
