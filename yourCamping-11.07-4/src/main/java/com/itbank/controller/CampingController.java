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
	public ModelAndView campingList(@PathVariable("page") int page, @RequestParam HashMap<String, String> param) {
		ModelAndView mav = new ModelAndView("/camping/list");
		if (param != null && param.get("listType") != null) {
			switch ((String) param.get("listType")) {
			case ("map"):
				mav.setViewName("/camping/map");
				mav.addObject("listType", "map");
				break;
			case ("list"):
				mav.addObject("listType", "list");
				break;
			}
		}
		int tmp = page;
		int boardCount = campingService.getListCnt();
		boolean flag1 = param.containsKey("keyword");
		if (flag1) {
			if (param.get("keyword").equals("")) {
				param.put("keyword", null);
				flag1 = !flag1;
			} 
		}
		boolean flag2 = param.containsKey("induty");
		if (flag2) {
			if (param.get("induty").equals("전체")) {
				param.put("induty", null);
				flag2 = !flag2;
			}
		}
		boolean flag3 = param.containsKey("lctcl");
		if (flag3) {
			if (param.get("lctcl").equals("전체")) {
				param.put("lctcl", null);
				flag3 = !flag3;
			}
		}
		boolean flag4 = param.containsKey("firstSelect");
		if (flag4) {
			if (param.get("firstSelect").equals("전체")) {
				param.put("firstSelect", null);
				flag4 = !flag4;
			}
		}
		
		if (flag1 || flag2 || flag3 || flag4) {
//			tmp = 1;
			boardCount = campingService.getSearchCnt(param);
		}
		PagingService paging = new PagingService(tmp, boardCount);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		for (String key : param.keySet()) {
			params.put(key, param.get(key));
		}
		params.put("paging", paging);
		List<CampingDTO> list = campingService.getCampingList(params);
		mav.addObject("param", params);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("page", page);
		return mav;
	}

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
