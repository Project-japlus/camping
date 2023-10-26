package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itbank.component.Test1Component;

@Controller
public class HomeController {
	
	@Autowired private Test1Component test1Component;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
//	@GetMapping("/camping")
//	public String camping() throws IOException {
//		String jsonData = testComponent.getJsonString();
////		System.out.println(jsonData);
//		return "redirect:/";
//	}
	
	@GetMapping("/camping")
	public String camping() {
		// API 인증키
		String serviceKey = "3UOa%2Bm18t4tgk4tkEt2cgwKPyD1cRds2kIJKrLP8u6W845dgWraqNvugbLwBQf6dKOXLEQj6qnREK4GJzAming%3D%3D";
		
		// 파일이 저장될 위치
		String filePath = "C:\\Users\\user\\OneDrive\\project\\camping.xlsx";
		
		test1Component.convertCampingDataToExcel(serviceKey, filePath);
		
		return "redirect:/";
	}
}
