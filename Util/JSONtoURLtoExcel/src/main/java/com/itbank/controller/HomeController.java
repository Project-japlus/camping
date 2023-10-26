package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itbank.component.ChangeComponent;

@Controller
public class HomeController {
	
	@Autowired private ChangeComponent change;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/start")
	public String start() throws Exception {
		String serviceKey = "3UOa%2Bm18t4tgk4tkEt2cgwKPyD1cRds2kIJKrLP8u6W845dgWraqNvugbLwBQf6dKOXLEQj6qnREK4GJzAming%3D%3D";
		String filePath = "C:\\Users\\user\\OneDrive\\project\\camping_inner_img.xlsx";
		change.changeURL(serviceKey, filePath);
		return "redirect:/";
	}
}
