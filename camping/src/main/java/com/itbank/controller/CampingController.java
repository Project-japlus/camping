package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.service.CampingService;
import com.itbank.service.PagingService;

@Controller
@RequestMapping("/camping")
public class CampingController {
	
	@Autowired private CampingService campingService;
	
//	@GetMapping("/list/{pageNo}")
//	public ModelAndView campingList(@PathVariable("pageNo") int pageNo) {
//		ModelAndView mav = new ModelAndView("/camping/list");
//		mav.addObject("list", campingService.paging(pageNo));
//		mav.addObject("list_cnt", campingService.getListCnt());
//		mav.addObject("pageNo", pageNo);
//		return mav;
//	}
	@GetMapping("/list/{pageNo}")
	public ModelAndView campingList(@PathVariable("pageNo") int pageNo) {
		ModelAndView mav = new ModelAndView("/camping/list");
		int boardCount = campingService.getListCnt();
		PagingService paging = new PagingService(pageNo, boardCount);
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("paging", paging);
		
		List<CampingDTO> list = campingService.getCampingList(param);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
}
