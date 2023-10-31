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
@RequestMapping("/camping/view/ajax/{camping_idx}")
public class AjaxController {

	@Autowired private WeatherComponent weatherComponent;
	
	@GetMapping("/weatherShort")
	public String weatherShort(@PathVariable("camping_idx") int camping_idx) throws IOException {
		String jsonData = weatherComponent.getStringShort(DataType.JSON, camping_idx);
		System.out.println(jsonData);
		
		return jsonData;
	}
		
	@GetMapping("/weatherMid")
	public String weatherMid(@PathVariable("camping_idx") int camping_idx) throws IOException {
		String jsonData = weatherComponent.getStringMid(DataType.JSON, camping_idx);
		System.out.println(jsonData);
		
		return jsonData;
	}
	
	@GetMapping("/tempMid")
	public String tempMid(@PathVariable("camping_idx") int camping_idx) throws IOException {
		String jsonData = weatherComponent.getStringTemp(DataType.JSON, camping_idx);
		System.out.println(jsonData);
		
		return jsonData;
	}
}
