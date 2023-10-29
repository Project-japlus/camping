package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.User_tableDTO;
import com.itbank.service.ReservService;

@Controller
public class ReserveController {
	
	@Autowired private ReservService reserveService;
	
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<CampingDTO> list = reserveService.selectList();
		mav.addObject("list",list);
		return mav;
	}
	
	//camping, campin_site, camping_introduce 조인 
	@GetMapping("/reservation/{camping_idx}")
	public ModelAndView reservation(@PathVariable("camping_idx")int camping_idx) {
		ModelAndView mav = new ModelAndView("reservation");
		CampingDTO dto = reserveService.selectOne(camping_idx);
		mav.addObject("dto",dto);
		return mav;
	}
	
	
	//ReserveDTO 예약 넣기
	@PostMapping("/reservation/{camping_idx}")
	public String reservation(ReserveDTO reservedto , HttpSession session) {
		//user와 예약자 연결
		User_tableDTO login = (User_tableDTO) session.getAttribute("login");
		if(login == null) {
			return "redirect:/login";
		}
		reservedto.setUser_idx(login.getUser_idx());
//		System.out.println(reservedto.getReserve_site());
		//추가하기
		int row = reserveService.reservation(reservedto);
		System.out.println(row + "번 예약 추가");
		return "redirect:/confirm/" + reservedto.getCamping_idx();
	}
	
	//예약자 확인 페이지로 넘어감
	@GetMapping("/confirm/{camping_idx}")
	public ModelAndView confirm(@PathVariable("camping_idx")int camping_idx) {
		ModelAndView mav = new ModelAndView("confirm");
		ReserveDTO reservedto = reserveService.reserveOne(camping_idx);
		mav.addObject("reservedto",reservedto);
		return mav;
	}
	
	
	
	//로그인
	@GetMapping("/login")
	public void login() {}
	
	
	@PostMapping("/login")
	public String login(User_tableDTO dto , HttpSession session) {
		User_tableDTO login = reserveService.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
		
	}
	

}
