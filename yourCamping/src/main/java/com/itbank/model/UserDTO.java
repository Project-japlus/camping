package com.itbank.model;

import java.util.List;

public class UserDTO {
	private int user_idx;
	private String userid;
	private String userpw;
	private String salt;
	private String username;
	private String role;
	private String phone;
	private String email;
	private String bizrno;
	
	// 10/31 추가함
	private boolean remember_bizr;
	
	// 11월 6일 추가
	private List<Integer> camping_idx;
	private String joinConfirm;
	
	// 11월 8일 추가
	private List<Integer> review_idx;
	
	public boolean isRemember_bizr() {
		return remember_bizr;
	}
	public void setRemember_bizr(boolean remember_bizr) {
		this.remember_bizr = remember_bizr;
	}
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getBizrno() {
		return bizrno;
	}
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	public List<Integer> getCamping_idx() {
		return camping_idx;
	}
	public void setCamping_idx(List<Integer> camping_idx) {
		this.camping_idx = camping_idx;
	}
	public String getJoinConfirm() {
		return joinConfirm;
	}
	public void setJoinConfirm(String joinConfirm) {
		this.joinConfirm = joinConfirm;
	}
	public List<Integer> getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(List<Integer> review_idx) {
		this.review_idx = review_idx;
	}
	
}
