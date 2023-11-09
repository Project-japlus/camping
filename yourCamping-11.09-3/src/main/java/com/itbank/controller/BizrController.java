package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.model.UserDTO;
import com.itbank.service.CampingService;

@Controller
@RequestMapping("/bizr")
public class BizrController {

	@Autowired
	private CampingService campingService;

	@GetMapping("/newCamping")
	public void newCamping() {
	}

	// 첫번째 form
	@PostMapping("/newCamping")
	public ModelAndView newCamping(CampingDTO dto, String firstSelect, String secondSelect, HttpSession session) {
		ModelAndView mav = new ModelAndView("/bizr/newCampingSecond");
		dto.setDoNm(firstSelect);
		dto.setSigunguNm(secondSelect);
		dto.setAddr1(dto.getDoNm() + " " + dto.getSigunguNm() + " " + dto.getAddr1());
		// 1.camping테이블과 camping_img, camping_place 테이블 insert
		UserDTO login = (UserDTO) session.getAttribute("login");
		dto.setUser_idx(login.getUser_idx());
		int row1 = campingService.campingInsert(dto);
		int maxCampingIdx = campingService.maxCampingIdx();
		if (row1 != 0) {
			dto.setCamping_idx(maxCampingIdx);
			campingService.campingImgInsert(dto);
			campingService.campingPlaceInsert(dto);
			campingService.activityInsert(dto);
		}
		return mav;
	}

	// 두번째 form
	@PostMapping("/newCampingSecond")
	public ModelAndView newCampingSecond(CampingDTO dto) {
		ModelAndView mav = new ModelAndView("/alert");
		int maxCampingIdx = campingService.maxCampingIdx();
		// 3.camping_internal테이블과 camping_safety_device테이블과 camping_site테이블
		dto.setCamping_idx(maxCampingIdx);
		campingService.introduceInsert(dto);
		campingService.internalInsert(dto);
		campingService.safetyDeviceInsert(dto);
		campingService.campingSiteInsert(dto);
		mav.addObject("camping_idx", maxCampingIdx);
		mav.addObject("msg", "캠핑장이 등록되었습니다");
		mav.addObject("url", "view");
		return mav;
	}

	// 두번째에서 이전 누를 때
	@GetMapping("/prevPage")
	@ResponseBody
	public String prevPage() {
		int maxCampingIdx = campingService.maxCampingIdx();
		campingService.deleteCampingPlace(maxCampingIdx);
		campingService.deleteCampingActivity(maxCampingIdx);
		campingService.deleteCampingImg(maxCampingIdx);
		campingService.deleteCamping(maxCampingIdx);
		return "<script>history.go(-2);</script>";
	}

	@GetMapping("/campingUpdate/{camping_idx}")
	public ModelAndView campingUpdate(@PathVariable("camping_idx") int camping_idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/bizr/campingUpdate");
		if (session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해 주세요");
			mav.addObject("url", "home");
		}
		CampingDTO dto = campingService.selectCamping(camping_idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/campingUpdate/{camping_idx}")
	public ModelAndView campingUpdate(@PathVariable("camping_idx") int camping_idx, CampingDTO dto, String firstSelect,
			String secondSelect) {
		ModelAndView mav = new ModelAndView("/bizr/campingUpdateTwo");
		dto.setCamping_idx(camping_idx);
		dto.setDoNm(firstSelect);
		dto.setSigunguNm(secondSelect);
		dto.setAddr1(firstSelect + " " + secondSelect + " " + dto.getAddr1());
		campingService.updateCamping(dto);
		campingService.deleteCampingImg(camping_idx);
		campingService.campingImgInsert(dto);
		campingService.updateInfoTwo(dto);		// camping_place테이블
		campingService.updateActivity(dto);
		CampingDTO camping = campingService.selectCampingTwo(camping_idx);
		mav.addObject("camping", camping);
		return mav;
	}

	@PostMapping("/campingUpdateTwo/{camping_idx}")
	public ModelAndView campingUpdateThird(@PathVariable("camping_idx") int camping_idx, CampingDTO dto) {
		ModelAndView mav = new ModelAndView("/alert");
		dto.setCamping_idx(camping_idx);
		campingService.updateIntroduce(dto);
		campingService.updateInternal(dto);
		campingService.updateSafety(dto);
		campingService.updateSite(dto);
		mav.addObject("camping_idx", camping_idx);
		mav.addObject("msg", "캠핑장 정보를 수정하였습니다");
		mav.addObject("url", "view");
		return mav;
	}

	@GetMapping("/campingDelete/{camping_idx}")
	public ModelAndView campingDelete(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("/alert");
		campingService.updateConfirm(camping_idx);
		mav.addObject("msg", "캠핑장이 삭제되었습니다");
		mav.addObject("url", "list");
		return mav;
	}
}
