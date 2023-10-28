package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.model.Paging;
import com.itbank.service.CampingService;

@Controller
public class CampingController {
	@Autowired private CampingService campingService;
	
	@GetMapping("/list")
	public String list() {
		return "redirect:/list/1";
	}
	
	@GetMapping("/list/{page}")
	public ModelAndView list(@PathVariable("page") int page) {
		ModelAndView mav = new ModelAndView("list");
		int totalCount = campingService.getTotalCount();
		Paging paging = new Paging(page, totalCount);
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("paging", paging);
		
		List<CampingDTO> list = campingService.selectAll(param);                         
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/mapList/{page}")
	public ModelAndView map1(@PathVariable("page") int page) {
		System.out.println("page :" + page);
		ModelAndView mav = new ModelAndView("map");
		int totalCount = campingService.getTotalCount();
		Paging paging = new Paging(page, totalCount);
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("paging", paging);
		
		List<CampingDTO> list = campingService.selectAll(param);                         
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
		
	}
	
	@GetMapping("/view/{camping_idx}")
	public ModelAndView view(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("view");
		CampingDTO dto = campingService.selectOne(camping_idx);
		List<CampingDTO> image = campingService.selectOneImage(camping_idx);
		mav.addObject("dto", dto);
		mav.addObject("image", image);
		return mav;
	}
	
	@GetMapping("/map/{list}")
	public ModelAndView map(@PathVariable("/list") List<CampingDTO> list) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		return mav;
		
	}
	

}
