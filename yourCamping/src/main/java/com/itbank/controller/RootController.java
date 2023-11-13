package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BizrDTO;
import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;
import com.itbank.service.RootService;

@Controller
@RequestMapping("/root")
public class RootController {

	@Autowired
	private RootService rootService;

	// 관리자페이지(리스트)
	@GetMapping("/rootPage")
	public ModelAndView userReservePage() {
		ModelAndView mav = new ModelAndView();
		List<ReserveDTO> list = rootService.selectList();
		mav.addObject("list", list);
		return mav;
	}

	// 예약글 상세 (단일)
	@GetMapping("/rootDetail/{reserve_idx}")
	public ModelAndView rootDetail(@PathVariable("reserve_idx") int reserve_idx) {
		ModelAndView mav = new ModelAndView("/root/rootDetail");
		ReserveDTO reservedto = rootService.rootSelectOne(reserve_idx);
		mav.addObject("reservedto", reservedto);
		return mav;
	}

	// 예약취소처리
	@GetMapping("/reserveDelete/{reserve_idx}")
	public String reserveDelete(@PathVariable("reserve_idx") int reserve_idx) {
		int row = rootService.reserveDelete(reserve_idx);
		System.out.println(row != 0 ? "예약취소성공" : "예약취소실패");
		return "redirect:/root/rootPage";
	}

	// 유저관리
	@GetMapping("/userManage")
	public ModelAndView userManage(UserDTO userdto) {
		ModelAndView mav = new ModelAndView();
		List<UserDTO> userlist = rootService.userList(userdto);
		mav.addObject("userlist", userlist);
		return mav;
	}

	// 유저 비활성화
	@GetMapping("/userDisabled/{user_idx}")
	public String userDisabled(@PathVariable("user_idx") int user_idx) {
		int row = rootService.rootDisabled(user_idx);
		System.out.println(row != 0 ? "비활성화" : "비활성화실패");
		return "redirect:/root/userManage";
	}

	// 사업자 캠핑등록내역
	@GetMapping("/bizr_regist")
	public ModelAndView bizr_regist(CampingDTO cdto) {
		ModelAndView mav = new ModelAndView();
		List<CampingDTO> newList = rootService.newCampingList(cdto);
		mav.addObject("newList", newList);
		return mav;
	}

	// 등록글 상세 (단일)
	@GetMapping("/newListOne/{camping_idx}")
	public ModelAndView newListOne(@PathVariable("camping_idx") int camping_idx) {
		ModelAndView mav = new ModelAndView("/root/newListOne");
		CampingDTO cdto = rootService.newListOne(camping_idx);
		mav.addObject("cdto", cdto);
		return mav;
	}

	// 사업주내역
	@GetMapping("/bizrManage")
	public ModelAndView bizrManage(BizrDTO bizrdto) {
		ModelAndView mav = new ModelAndView();
		List<BizrDTO> bizrlist = rootService.bizrList(bizrdto);
		mav.addObject("bizrlist", bizrlist);
		return mav;
	}
}
