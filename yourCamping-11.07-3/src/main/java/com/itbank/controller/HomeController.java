package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.model.FreeDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.service.BoardService;
import com.itbank.service.CampingService;

@Controller
public class HomeController {
	
	@Autowired private CampingService campingService;
	@Autowired private BoardService boardService;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		List<CampingDTO> campList = campingService.campingSortViewCount();
		List<ReviewDTO> revList = boardService.reviewSortViewCount();
		List<FreeDTO> freeList = boardService.freeSortViewCount();
		
		mav.addObject("campList", campList);
		mav.addObject("revList", revList);
		mav.addObject("freeList", freeList);
		return mav;
	}
}