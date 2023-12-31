
package com.itbank.model;

import java.sql.Date;

public class ReserveDTO {
	private int reserve_idx;
	private int user_idx;
	private int camping_idx;
	private String reserve_site;
	private int reserve_price;
	private int human_cnt;
	private int car_cnt;
	private Date reserve_str_date;
	private Date reserve_end_date;
	private String facltnm;
	private String payment;
	private int totalPrice;
	// join
	private String username;
	private String email;
	private String phone;
	private String userid;
	private int useridx;

	// 11/8 추가함
	private String tel;
	private String homepage;

	public String getFacltnm() {
		return facltnm;
	}

	public void setFacltnm(String facltnm) {
		this.facltnm = facltnm;
	}

	public int getReserve_idx() {
		return reserve_idx;
	}

	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
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

	public String getReserve_site() {
		return reserve_site;
	}

	public void setReserve_site(String reserve_site) {
		this.reserve_site = reserve_site;
	}

	public int getReserve_price() {
		return reserve_price;
	}

	public void setReserve_price(int reserve_price) {
		this.reserve_price = reserve_price;
	}

	public Date getReserve_str_date() {
		return reserve_str_date;
	}

	public void setReserve_str_date(Date reserve_str_date) {
		this.reserve_str_date = reserve_str_date;
	}

	public int getHuman_cnt() {
		return human_cnt;
	}

	public void setHuman_cnt(int human_cnt) {
		this.human_cnt = human_cnt;
	}

	public int getCar_cnt() {
		return car_cnt;
	}

	public void setCar_cnt(int car_cnt) {
		this.car_cnt = car_cnt;
	}

	public Date getReserve_end_date() {
		return reserve_end_date;
	}

	public void setReserve_end_date(Date reserve_end_date) {
		this.reserve_end_date = reserve_end_date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getUseridx() {
		return useridx;
	}

	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

}