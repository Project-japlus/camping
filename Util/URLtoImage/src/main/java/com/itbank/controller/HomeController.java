package com.itbank.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.AllImgComponent;
import com.itbank.component.URLtoImgComponent;

@Controller
public class HomeController {
	
	@Autowired private URLtoImgComponent component;
	@Autowired private AllImgComponent AIcomponent;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/downImg")
	public String downImg() {
		// API 인증키
		String serviceKey = "3UOa%2Bm18t4tgk4tkEt2cgwKPyD1cRds2kIJKrLP8u6W845dgWraqNvugbLwBQf6dKOXLEQj6qnREK4GJzAming%3D%3D";
				
//		// 파일이 저장될 위치
//		String filePath = "C:\\Users\\user\\OneDrive\\project\\camping.xlsx";		
		
		Map<String, String> test = component.downImg(serviceKey);
		return "redirect:/";
	}
	
	@GetMapping("/allImg")
	public String allImg() {
		String serviceKey = "3UOa%2Bm18t4tgk4tkEt2cgwKPyD1cRds2kIJKrLP8u6W845dgWraqNvugbLwBQf6dKOXLEQj6qnREK4GJzAming%3D%3D";
		
		AIcomponent.downImg(serviceKey);
		
		return "redirect:/";
	}
}
