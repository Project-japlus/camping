package com.itbank.util;

public enum DataType {
	
	XML("xml"),		// 기울어진 글씨 + 굵은 글씨
	JSON("json");	// static	 + final
	
	private String dataType;
	
	private DataType(String dataType) {
		this.dataType = dataType;
	}
	
	public String getDataType() {
		return dataType;
	}
}
