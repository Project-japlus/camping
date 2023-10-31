package com.itbank.model;


/*
 * 이름                널?       유형             
	----------------- -------- -------------- 
	CAMPING_IDX       NOT NULL NUMBER         
	FACLTNM           NOT NULL VARCHAR2(128)  
	FEATURENM                  VARCHAR2(4000) 
	INTRO                      VARCHAR2(4000) 
	LINEINTRO                  VARCHAR2(1000) 
	TOOLTIP                    VARCHAR2(4000) 
	INDUTY            NOT NULL VARCHAR2(100)  
	TEL                        VARCHAR2(26)   
	HOMEPAGE                   VARCHAR2(128)  
	LCTCL                      VARCHAR2(26)   
	ADDR1             NOT NULL VARCHAR2(200)  
	CAMPING_VIEWCOUNT NOT NULL NUMBER(38)     
 *  
 *  */
public class CampingDTO {
	//camping
	private int camping_idx;	//	idx
	private String facltnm;		//	캠핑장이름
	
	//camping_site (사이트 갯수, 가격)
	private int sitemg1co;
	private int sitemg2co;
	private int sitemg3co;
	
	private int sitemg1_price;
	private int sitemg2_price;
	private int sitemg3_price;
	
	//camping_introduce 바닥재			
	private int sitebottomcl1;
	private int sitebottomcl2;
	private int sitebottomcl3;
	private int sitebottomcl4;
	private int sitebottomcl5;
	
	
	public int getCamping_idx() {
		return camping_idx;
	}
	public void setCamping_idx(int camping_idx) {
		this.camping_idx = camping_idx;
	}
	public String getFacltnm() {
		return facltnm;
	}
	public void setFacltnm(String facltnm) {
		this.facltnm = facltnm;
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
	public int getSitebottomcl1() {
		return sitebottomcl1;
	}
	public void setSitebottomcl1(int sitebottomcl1) {
		this.sitebottomcl1 = sitebottomcl1;
	}
	public int getSitebottomcl2() {
		return sitebottomcl2;
	}
	public void setSitebottomcl2(int sitebottomcl2) {
		this.sitebottomcl2 = sitebottomcl2;
	}
	public int getSitebottomcl3() {
		return sitebottomcl3;
	}
	public void setSitebottomcl3(int sitebottomcl3) {
		this.sitebottomcl3 = sitebottomcl3;
	}
	public int getSitebottomcl4() {
		return sitebottomcl4;
	}
	public void setSitebottomcl4(int sitebottomcl4) {
		this.sitebottomcl4 = sitebottomcl4;
	}
	public int getSitebottomcl5() {
		return sitebottomcl5;
	}
	public void setSitebottomcl5(int sitebottomcl5) {
		this.sitebottomcl5 = sitebottomcl5;
	}
	
	
	
	
	


	
}
