package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	// review
	private int review_idx;
	private int user_idx;
	private int camping_idx;
	private String review_title;
	private String review_content;
	private String review_img;
	private Date review_wdate;
	private int review_viewCount;
	
	private MultipartFile[] upload;
	
	private String userid;	// 조인으로 같이 불러올 userid
	private String facltnm; // 조인으로 같이 불러올 캠핑장 이름
	private int like_count;	// 조인으로 같이 불러올 review_like의 수량
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
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
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public Date getReview_wdate() {
		return review_wdate;
	}
	public void setReview_wdate(Date review_wdate) {
		this.review_wdate = review_wdate;
	}
	public int getReview_viewCount() {
		return review_viewCount;
	}
	public void setReview_viewCount(int review_viewCount) {
		this.review_viewCount = review_viewCount;
	}
	public MultipartFile[] getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile[] upload) {
		this.upload = upload;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getFacltnm() {
		return facltnm;
	}
	public void setFacltnm(String facltnm) {
		this.facltnm = facltnm;
	}
}
