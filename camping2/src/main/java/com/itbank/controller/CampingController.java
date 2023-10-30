package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.model.Paging;
import com.itbank.service.CampingService;

@Controller
public class CampingController {
	@Autowired private CampingService campingService;
	
	// 리스트
	@GetMapping("/list")
	public String list() {
		return "redirect:/list/1";
	}
	
	// 리스트 페이징
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
	public ModelAndView mapList(@PathVariable("page")int page, @RequestParam HashMap<String, Object> param) {
		ModelAndView mav = new ModelAndView("mapList");
		int totalCount = campingService.getTotalCount();
		Paging paging = new Paging(page, totalCount);
		System.out.println(param);
		
		param.put("paging", paging);
		List<CampingDTO> list = campingService.search(param);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("param", param);
		return mav;
	}
	
	@GetMapping("/searchList")
	public String searchList() {
		return "redirect:/searchList/1";
	}
	@GetMapping("/searchList/{page}")
	public ModelAndView searchList(@PathVariable("page")int page, @RequestParam HashMap<String, Object> param) {
		System.out.println("호출");
		ModelAndView mav = new ModelAndView("list");
		int totalCount = campingService.getSearchTotal(param);
		Paging paging = new Paging(page, totalCount);
		param.put("paging", paging);
		List<CampingDTO> list = campingService.search(param);
		mav.addObject("page", page);
		mav.addObject("paging", paging);
		mav.addObject("param", param);
		mav.addObject("list", list);
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
	

}
