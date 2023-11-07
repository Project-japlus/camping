package com.itbank.model;

import java.sql.Date;

public class ReplyDTO {

	private int user_idx;
	private int free_table_idx;
	private Date reply_wdate;
	private String reply_content;
	
	private String userid;
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getFree_table_idx() {
		return free_table_idx;
	}
	public void setFree_table_idx(int free_table_idx) {
		this.free_table_idx = free_table_idx;
	}
	public Date getReply_wdate() {
		return reply_wdate;
	}
	public void setReply_wdate(Date reply_wdate) {
		this.reply_wdate = reply_wdate;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
