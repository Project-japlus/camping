package com.itbank.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ListController {
	
	@GetMapping("/calen")
	public void calen() {}

	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
