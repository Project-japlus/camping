package com.itbank.controller;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@GetMapping({"/searchList", "/mapList"}) 
	public ModelAndView searchList(@RequestParam HashMap<String, Object> param, HttpServletRequest request) {
		int page = 1; 			// 기본 페이지 설정
		if(param.containsKey("page")) {
		    try {
		       page = Integer.parseInt(param.get("page").toString()); 
		    } catch (NumberFormatException e) {
		       e.printStackTrace(); 
		    }
		}
		ModelAndView mav = new ModelAndView(); 
	    if (request.getRequestURI().contains("searchList")) {
	    	mav.setViewName("list");
	    } 
	    else {
	        mav.setViewName("mapList");
	    }
	    int totalCount = request.getRequestURI().contains("searchList") ? campingService.getSearchTotal(param) : campingService.getTotalCount();
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
	
	@GetMapping("/newCamping")
	public void newCamping() {}
	
	// 첫번째 form
	@PostMapping("/newCamping")
	public ModelAndView newCamping(CampingDTO dto, String firstSelect, String secondSelect, HttpSession session) {
		ModelAndView mav = new ModelAndView("newCampingSecond");
		dto.setDoNm(firstSelect);
		dto.setSigunguNm(secondSelect);
		dto.setAddr1(dto.getDoNm() + " " +  dto.getSigunguNm() + " " + dto.getAddr1());
		// 1.camping테이블과 camping_img
//		UserDTO login = (UserDTO)session.getAttribute("login");
//		dto.setUserid(login.getUserid());
		int row1 = campingService.campingInsert(dto);
		int maxCampingIdx = campingService.maxCampingIdx();
//		 여기서부터 !
		if(row1 != 0) {
			dto.setCamping_idx(maxCampingIdx);
			campingService.campingImgInsert(dto);
		}
		mav.addObject("addr1", dto.getAddr1());
		return mav;
	} 
	
	// 두번째 form
	@PostMapping("/newCampingSecond")
	public String newCampingSecond(CampingDTO dto) {
		int maxCampingIdx = campingService.maxCampingIdx();
		// 2.camping_place테이블과 camping_activity테이블과 camping_introduce테이블
		dto.setCamping_idx(maxCampingIdx);
		campingService.campingPlaceInsert(dto);
		campingService.activityInsert(dto);
		campingService.introduceInsert(dto);
		return "newCampingThird";
	}
	
	// 세번째 form
	@PostMapping("/newCampingThird")
	public String newCampingThird(CampingDTO camping) {
		int maxCampingIdx = campingService.maxCampingIdx();
		// 3.camping_internal테이블과 camping_safety_device테이블과 camping_site테이블
		camping.setCamping_idx(maxCampingIdx);
		campingService.internalInsert(camping);
		campingService.safetyDeviceInsert(camping);
		campingService.campingSiteInsert(camping);
		return "redirect:/list/1"; 
	}
	
	// 두번째에서 이전 누를 때
	@GetMapping("/prevPage")
	@ResponseBody
	public String prevPage() {
		int maxCampingIdx = campingService.maxCampingIdx();
		System.out.println(maxCampingIdx);
		CampingDTO dto = campingService.selectOneByImg(maxCampingIdx);
		campingService.deleteCampingImg(dto);
		campingService.deleteCamping(maxCampingIdx);
		return "<script>history.go(-2);</script>";
	}

	@GetMapping("/prevPageTwo")
	@ResponseBody
	public String prevPagetwo() {
		int maxCampingIdx = campingService.maxCampingIdx();
		campingService.deleteCampingActivity(maxCampingIdx);
		campingService.deleteCampingIntoduce(maxCampingIdx);
		campingService.deleteCampingPlace(maxCampingIdx);
		return "<script>history.go(-2);</script>";
	}
	
	@GetMapping("/campingUpdate/{camping_idx}")
	public ModelAndView campingUpdate(@PathVariable("camping_idx")int camping_idx) {
		ModelAndView mav = new ModelAndView("campingUpdate");
		CampingDTO dto = campingService.selectCamping(camping_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	@PostMapping("/campingUpdate/{camping_idx}")
	public ModelAndView campingUpdate(@PathVariable("camping_idx")int camping_idx, CampingDTO dto, String firstSelect, String secondSelect) {
		ModelAndView mav = new ModelAndView("campingUpdateTwo");
		dto.setCamping_idx(camping_idx);
		dto.setDoNm(firstSelect);
		dto.setSigunguNm(secondSelect);
		dto.setAddr1(firstSelect + " " + secondSelect +  " " + dto.getAddr1()); 
		campingService.updateCamping(dto);
		campingService.updateCampingImg(dto);
		CampingDTO camping = campingService.selectCampingTwo(camping_idx);
		mav.addObject("addr1", dto.getAddr1());
		mav.addObject("camping", camping);
		return mav;
	}
	
	@PostMapping("/campingUpdateTwo/{camping_idx}")
	public ModelAndView campingUpdateTwo(@PathVariable("camping_idx")int camping_idx, CampingDTO dto) {
		ModelAndView mav = new ModelAndView("campingUpdateThird");
		dto.setCamping_idx(camping_idx);
		dto.setMapX(dto.getMapX());
		dto.setMapY(dto.getMapY());
		campingService.updateActivity(dto);
		campingService.updateIntroduce(dto);
		campingService.updateInfoTwo(dto);
		CampingDTO camping = campingService.selectCampingThree(camping_idx);
		mav.addObject("camping", camping);
		mav.addObject("camping_idx", camping_idx);
		return mav;
	}
	@PostMapping("/campingUpdateThird/{camping_idx}")
	public ModelAndView campingUpdateThird(@PathVariable("camping_idx")int camping_idx, CampingDTO camping) {
		ModelAndView mav = new ModelAndView("view");
		camping.setCamping_idx(camping_idx);
		campingService.updateInternal(camping);
		campingService.updateSafety(camping);
		campingService.updateSite(camping);
		CampingDTO dto = campingService.selectOne(camping_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/campingDelete/{camping_idx}")
	public String campingDelete(@PathVariable("camping_idx")int camping_idx) {
		campingService.deleteCampingSite(camping_idx);
		campingService.deleteCampingSafetyDevice(camping_idx);
		campingService.deleteCampingInternal(camping_idx);
		campingService.deleteCampingPlace(camping_idx);
		campingService.deleteCampingIntoduce(camping_idx);
		campingService.deleteCampingActivity(camping_idx);
		CampingDTO dto = campingService.selectOneByImg(camping_idx);
		campingService.deleteCampingImg(dto);
		campingService.deleteCamping(camping_idx);
		return "redirect:/list/1";
	}
	
}
