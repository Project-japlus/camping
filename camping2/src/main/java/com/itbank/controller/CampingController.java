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
	
	// 리스트에서 지도로 보기로 넘길 때(검색어가 있으면 있는거만, 없으면 전체)
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
		return mav;
	}
	
//	// 리스트에서 지도로 보기로 넘길 때(검색어가 있으면 있는거만, 없으면 전체)
//	@GetMapping("/mapList/{page}/{firstSelect}/{secondSelect}/{details}")
//	public ModelAndView mapList(@PathVariable("page")int page, String firstSelect, String secondSelect, String details) {
//		ModelAndView mav = new ModelAndView("mapList");
//		HashMap<String, Object> param = new HashMap<>();
//		int totalCount = campingService.getTotalCount();
//		Paging paging = new Paging(page, totalCount);
//		
//		param.put("paging", paging);
//		param.put("firstSelect", firstSelect);
//		param.put("secondSelect", secondSelect);
//		param.put("details", details);
//		
//		List<CampingDTO> list = campingService.search(param);
//		mav.addObject("list", list);
//		mav.addObject("paging", paging);
//		return mav;
//	}

//	// 지도로 보기로 이동
//	@GetMapping("/mapList/{page}")
//	public ModelAndView mapList(@PathVariable("page") int page) {
//		ModelAndView mav = new ModelAndView("mapList");
//		int totalCount = campingService.getTotalCount();
//		Paging paging = new Paging(page, totalCount);
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		param.put("paging", paging);
//		
//		List<CampingDTO> list = campingService.selectAll(param);                         
//		mav.addObject("list", list);
//		mav.addObject("paging", paging);
//		return mav;
//	}
	@GetMapping("/search")
	public String search() {
		return "redirect:/search/1";
	}
	
	// keyword있는지 체크 필요
	@GetMapping("/search/{page}")
	public ModelAndView search(@RequestParam HashMap<String, Object> param) {
		ModelAndView mav = new ModelAndView("searchResult");
		List<CampingDTO> list = campingService.search(param);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/searchList")
	public String searchList() {
		return "redirect:/searchList/1";
	}
	
	@GetMapping("/searchList/{page}")
	public ModelAndView searchList(@RequestParam HashMap<String, Object> param) {
		System.out.println(param);
		ModelAndView mav = new ModelAndView("list");
		List<CampingDTO> list = campingService.search(param);
		mav.addObject("list", list);
		return mav;
	}
	
//	// 지도로 보기에서 키워드 검색
//	@GetMapping("/search/{page}")
//	public ModelAndView searchKeyword(@PathVariable("page")int page, String keyword) {
//		ModelAndView mav = new ModelAndView("searchKeyword");
//		int totalCount = campingService.getSearchTotal(keyword);
//		Paging paging = new Paging(page, totalCount);
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		param.put("paging", paging);
//		param.put("keyword", keyword);
//		
//		List<CampingDTO> list = campingService.searchKeyword(param);
//		mav.addObject("keyword", keyword);
//		mav.addObject("list", list);
//		mav.addObject("paging", paging);
//		return mav;
//	}
	
	
//	// 키워드 검색 결과에서 페이징 눌렀을 때
//	@GetMapping("/searchList/{page}")
//	public ModelAndView searchList(@PathVariable("page")int page, @PathVariable("keyword")String keyword) {
//		ModelAndView mav = new ModelAndView("searchKeyword");
//		int totalCount = campingService.getSearchTotal(keyword);
//		Paging paging = new Paging(page, totalCount);
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		param.put("paging", paging);
//		param.put("keyword", keyword);
//		
//		List<CampingDTO> list = campingService.searchKeyword(param);
//		mav.addObject("list", list);
//		mav.addObject("paging", paging);
//		return mav;
//	}
	
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
