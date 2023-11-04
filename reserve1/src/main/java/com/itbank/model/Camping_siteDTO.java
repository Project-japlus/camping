package com.itbank.model;

/* 
 * 이름            널?       유형         
	------------- -------- ---------- 
	CAMPING_IDX   NOT NULL NUMBER(38) 
	SITEMG1CO     NOT NULL NUMBER(38) 
	SITEMG2CO              NUMBER(38) 
	SITEMG3CO              NUMBER(38) 
	SITEMG1_PRICE NOT NULL NUMBER(38) 
	SITEMG2_PRICE          NUMBER(38) 
	SITEMG3_PRICE NOT NULL NUMBER(38) 
 * 
 * */
public class Camping_siteDTO {
	private int camping_idx;
	private int sitemg1co;
	private int sitemg2co;
	private int sitemg3co;
	private int sitemg1_price;
	private int sitemg2_price;
	private int sitemg3_price;
	
	
	public int getCamping_idx() {
		return camping_idx;
	}
	public void setCamping_idx(int camping_idx) {
		this.camping_idx = camping_idx;
	}
	public int getSitemg1co() {
		return sitemg1co;
	}
	public void setSitemg1co(int sitemg1co) {
		this.sitemg1co = sitemg1co;
	}
	public int getSitemg2co() {
		return sitemg2co;
	}
	public void setSitemg2co(int sitemg2co) {
		this.sitemg2co = sitemg2co;
	}
	public int getSitemg3co() {
		return sitemg3co;
	}
	public void setSitemg3co(int sitemg3co) {
		this.sitemg3co = sitemg3co;
	}
	public int getSitemg1_price() {
		return sitemg1_price;
	}
	public void setSitemg1_price(int sitemg1_price) {
		this.sitemg1_price = sitemg1_price;
	}
	public int getSitemg2_price() {
		return sitemg2_price;
	}
	public void setSitemg2_price(int sitemg2_price) {
		this.sitemg2_price = sitemg2_price;
	}
	public int getSitemg3_price() {
		return sitemg3_price;
	}
	public void setSitemg3_price(int sitemg3_price) {
		this.sitemg3_price = sitemg3_price;
	}
	
	
	
	
}
