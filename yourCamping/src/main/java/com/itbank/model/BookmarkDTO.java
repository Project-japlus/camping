package com.itbank.model;

public class BookmarkDTO {
	
	private int user_idx;
	private int camping_idx;
	private String facltnm;
	private String homepage;
	private String tel;
	
	
	public String getFacltnm() {
		return facltnm;
	}
	public void setFacltnm(String facltnm) {
		this.facltnm = facltnm;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getCamping_idx() {
		return camping_idx;
	}
	public void setCamping_idx(int camping_idx) {
		this.camping_idx = camping_idx;
	}

}
