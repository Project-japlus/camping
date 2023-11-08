package com.itbank.model;

public class LatLngDTO {

	private double lat;	// 위도
	private double lng;	// 경도

	private double x;	// 격자 x좌표
	private double y;	// 격자 y좌표
	
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
}
