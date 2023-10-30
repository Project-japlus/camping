package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.service.CampingService;
import com.itbank.service.PagingService;

@Controller
@RequestMapping("/camping")
public class CampingController {

	@Autowired
	private CampingService campingService;

	@GetMapping("/list/{page}")
	public ModelAndView campingList(@PathVariable("page") int page,
			@RequestParam(value = "listType", defaultValue = "list") String listType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "induty", defaultValue = "") String induty) {
		ModelAndView mav = new ModelAndView("/camping/list");
		if (listType.equals("map")) {
			mav.setViewName("/camping/map");
		}

		HashMap<String, Object> param = new HashMap<String, Object>();
		int boardCount = campingService.getListCnt();
		if (!keyword.equals("")) {
			page = 1;
			boardCount = campingService.getSearchCnt(keyword);
			param.put("keyword", keyword);
		}
		if (!induty.equals("")) {
			page = 1;
			boardCount = campingService.getIndutyCnt(induty);
			param.put("induty", induty);
		}
		PagingService paging = new PagingService(page, boardCount);
		param.put("paging", paging);

		List<CampingDTO> list = campingService.getCampingList(param);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("listType", listType);
		return mav;
	}

//	@GetMapping("/mapList/{page}")
//	public ModelAndView map1(@PathVariable("page") int page) {
//		System.out.println("page :" + page);
//		ModelAndView mav = new ModelAndView("/camping/map");
//		int totalCount = campingService.getListCnt();
//		PagingService paging = new PagingService(page, totalCount);
//		
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		param.put("paging", paging);
//		
//		List<CampingDTO> list = campingService.getCampingList(param);                         
//		mav.addObject("list", list);
//		mav.addObject("paging", paging);
//		return mav;
//	}

	@GetMapping("/view/{camping_idx}")
	public ModelAndView view(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("/camping/view");
		CampingDTO dto = campingService.selectOne(camping_idx);
		List<CampingDTO> image = campingService.selectOneImage(camping_idx);
		mav.addObject("dto", dto);
		mav.addObject("image", image);
		return mav;
	}
}
