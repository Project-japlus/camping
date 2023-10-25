package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.service.CampingService;

@Controller
public class CampingController {
	@Autowired private CampingService campingService;
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("list");
		List<CampingDTO> list = campingService.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/view/{camping_idx}")
	public ModelAndView view(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("view");
		CampingDTO dto = campingService.selectOne(camping_idx);
		mav.addObject("dto", dto);
		return mav;
	}
}
