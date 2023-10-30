package com.itbank.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.WeatherComponent;
import com.itbank.util.DataType;

@RestController
@RequestMapping("/camping/ajax")
public class AjaxController {

	@Autowired private WeatherComponent weatherComponent;
	
	@GetMapping("/weatherShort/{dataType}")
	public String weatherShort(@PathVariable("dataType") String dataType) throws IOException {
		dataType = dataType.toUpperCase();	// json을 JSON으로 변경
		String data = weatherComponent.getStringShort(DataType.valueOf(dataType));
		return data;
	}
	
	@GetMapping("/weatherShort")
	public String weatherShort() throws IOException {
		String jsonData = weatherComponent.getStringShort(DataType.JSON);
		System.out.println(jsonData);
		
		return jsonData;
	}
	
	@GetMapping("/weatherMid/{dataType}")
	public String weatherMid(@PathVariable("dataType") String dataType) throws IOException {
		dataType = dataType.toUpperCase();	// json을 JSON으로 변경
		String data = weatherComponent.getStringMid(DataType.valueOf(dataType));
		return data;
	}
		
	@GetMapping("/weatherMid")
	public String weatherMid() throws IOException {
		String jsonData = weatherComponent.getStringMid(DataType.JSON);
		System.out.println(jsonData);
		
		return jsonData;
	}
	
	@GetMapping("/tempMid/{dataType}")
	public String tempMid(@PathVariable("dataType") String dataType) throws IOException {
		dataType = dataType.toUpperCase();
		String data = weatherComponent.getStringTemp(DataType.valueOf(dataType));
		return data;
	}
	
	@GetMapping("/tempMid")
	public String tempMid() throws IOException {
		String jsonData = weatherComponent.getStringTemp(DataType.JSON);
		System.out.println(jsonData);
		
		return jsonData;
	}
}
