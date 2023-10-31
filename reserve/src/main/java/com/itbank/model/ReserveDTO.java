package com.itbank.model;

import java.sql.Date;

/*
 * 이름               널?       유형           
	---------------- -------- ------------ 
	RESERVE_IDX      NOT NULL NUMBER       
	USER_IDX         NOT NULL NUMBER       
	CAMPING_IDX      NOT NULL NUMBER       
	RESERVE_SITE     NOT NULL VARCHAR2(10) 
	RESERVE_PRICE    NOT NULL NUMBER       
	RESERVE_STR_DATE NOT NULL DATE         
	HUMAN_CNT        NOT NULL NUMBER       
	CAR_CNT                   NUMBER       
	RESERVE_END_DATE          DATE         
 *  
 *  */

//예약페이지 DTO
public class ReserveDTO {
	//reserve
	private int reserve_idx;		// 관리자페이지에서 전체 예약내역
	private int user_idx;			// 예약에서 idx로 고유키
	private int camping_idx;		// 해당 캠핑장이름 idx로 받아와야해서 
	private String reserve_site;	//사이트
	private int reserve_price;		//가격
	private Date reserve_str_date;	//캠핑시작일 날짜
	private Date reserve_end_date;	//캠핑끝일 날짜
	private int human_cnt;			//사람 수
	private int car_cnt;			//자동차 수
	private char payment;
	
	
	//조인 camping
	private String facltnm;		//캠핑장이름
	
	//조인  user_table 
	private String username;
	private String phone;
	private String email;
	
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
	public Date getReserve_end_date() {
		return reserve_end_date;
	}
	public void setReserve_end_date(Date reserve_end_date) {
		this.reserve_end_date = reserve_end_date;
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
	public char getPayment() {
		return payment;
	}
	public void setPayment(char payment) {
		this.payment = payment;
	}
	public String getFacltnm() {
		return facltnm;
	}
	public void setFacltnm(String facltnm) {
		this.facltnm = facltnm;
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
