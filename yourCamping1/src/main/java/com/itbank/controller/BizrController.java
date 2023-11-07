package com.itbank.controller;

import java.util.List;

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
import com.itbank.service.CampingService;

@Controller
@RequestMapping("/bizr")
public class BizrController {

	@Autowired
	private CampingService campingService;

	@GetMapping("/newCamping")
	public void newCamping() {}

	// 첫번째 form
	@PostMapping("/newCamping")
	public ModelAndView newCamping(CampingDTO dto, String firstSelect, String secondSelect, HttpSession session) {
		ModelAndView mav = new ModelAndView("/bizr/newCampingSecond");
		dto.setDoNm(firstSelect);
		dto.setSigunguNm(secondSelect);
		dto.setAddr1(dto.getDoNm() + " " + dto.getSigunguNm() + " " + dto.getAddr1());
		// 1.camping테이블과 camping_img
//			UserDTO login = (UserDTO)session.getAttribute("login");
//			dto.setUserid(login.getUserid());
		int row1 = campingService.campingInsert(dto);
		int maxCampingIdx = campingService.maxCampingIdx();
//			 여기서부터 !
		if (row1 != 0) {
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
		return "/bizr/newCampingThird";
	}

	// 세번째 form
	@PostMapping("/newCampingThird")
	public ModelAndView newCampingThird(CampingDTO camping) {
		ModelAndView mav = new ModelAndView("/alert");
		int maxCampingIdx = campingService.maxCampingIdx();
		// 3.camping_internal테이블과 camping_safety_device테이블과 camping_site테이블
		camping.setCamping_idx(maxCampingIdx);
		campingService.internalInsert(camping);
		campingService.safetyDeviceInsert(camping);
		campingService.campingSiteInsert(camping);
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
		System.out.println(maxCampingIdx);
		CampingDTO dto = campingService.selectOneByImg(maxCampingIdx);
		campingService.deleteCampingImg(dto);
		campingService.deleteCamping(maxCampingIdx);
		return "<script>history.go(-1);</script>";
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
	public ModelAndView campingUpdate(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("/bizr/campingUpdate");
		CampingDTO dto = campingService.selectCamping(camping_idx);
		List<CampingDTO> image = campingService.selectOneImage(camping_idx);
		mav.addObject("dto", dto);
		mav.addObject("image", image);
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
		campingService.updateCampingImg(dto);
		CampingDTO camping = campingService.selectCampingTwo(camping_idx);
		mav.addObject("addr1", dto.getAddr1());
		mav.addObject("camping", camping);
		return mav;
	}

	@PostMapping("/campingUpdateTwo/{camping_idx}")
	public ModelAndView campingUpdateTwo(@PathVariable("camping_idx") int camping_idx, CampingDTO dto) {
		ModelAndView mav = new ModelAndView("/bizr/campingUpdateThird");
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
	public ModelAndView campingUpdateThird(@PathVariable("camping_idx") int camping_idx, CampingDTO camping) {
		ModelAndView mav = new ModelAndView("/alert");
		camping.setCamping_idx(camping_idx);
		campingService.updateInternal(camping);
		campingService.updateSafety(camping);
		campingService.updateSite(camping);
		mav.addObject("camping_idx", camping_idx);
		mav.addObject("msg", "캠핑장 정보를 수정하였습니다");
		mav.addObject("url", "view");
		return mav;
	}

	@GetMapping("/campingDelete/{camping_idx}")
	public ModelAndView campingDelete(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("/alert");
		campingService.deleteCampingSite(camping_idx);
		campingService.deleteCampingSafetyDevice(camping_idx);
		campingService.deleteCampingInternal(camping_idx);
		campingService.deleteCampingPlace(camping_idx);
		campingService.deleteCampingIntoduce(camping_idx);
		campingService.deleteCampingActivity(camping_idx);
		CampingDTO dto = campingService.selectOneByImg(camping_idx);
		campingService.deleteCampingImg(dto);
		campingService.deleteCamping(camping_idx);
		mav.addObject("msg", "캠핑장이 삭제되었습니다");
		mav.addObject("url", "list");
		return mav;
	}
}
