package com.itbank.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;
import com.itbank.service.ReservService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired private ReservService reserveService;
	
	//camping, campin_site, camping_introduce 조인 
	@GetMapping("/reservation/{camping_idx}")
	public ModelAndView reservation(@PathVariable("camping_idx")int camping_idx, ReserveDTO rdto, HttpSession session) {
		ModelAndView mav = new ModelAndView("/reserve/reservation");		
		if(session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해주세요");
			mav.addObject("url", "home");
			return mav;
		}
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("camping_idx", camping_idx);
		param.put("reserve_str_date", rdto.getReserve_str_date());
		param.put("reserve_end_date", rdto.getReserve_end_date());
		
		CampingDTO cdto = reserveService.selectOne(camping_idx);	
		int aSco = reserveService.selectA(param);
		int bSco = reserveService.selectB(param);
		int	cSco = reserveService.selectC(param);
		
//		List<ReserveDTO> list = reserveService.reserveList(camping_idx);
		int aCount = cdto.getSiteMg1Co()-aSco;
		int bCount = cdto.getSiteMg1Co()-bSco;
		int cCount = cdto.getSiteMg1Co()-cSco;
		mav.addObject("cdto",cdto);
		mav.addObject("rdto",rdto);
		mav.addObject("aCount",aCount);
		mav.addObject("bCount",bCount);
		mav.addObject("cCount",cCount);
		return mav;
	}
	
	
	//ReserveDTO 예약 넣기
	@PostMapping("/reservation/{camping_idx}")
	public ModelAndView reservation(ReserveDTO reservedto , HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//user와 예약자 연결
		UserDTO login = (UserDTO) session.getAttribute("login");
		if(login == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해주세요");
			mav.addObject("url", "home");
			return mav;
		} else {
			reservedto.setUser_idx(login.getUser_idx());
			//추가하기
			reserveService.reservation(reservedto);
			int reserve_idx = reserveService.getMaxReserveIdx();
			mav.setViewName("redirect:/reserve/confirm/" + reserve_idx);
		}
		return mav;
	}
	
	//예약자 확인 페이지
	@GetMapping("/confirm/{reserve_idx}")
	public ModelAndView confirm(@PathVariable("reserve_idx")int reserve_idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/reserve/confirm");
		if(session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해주세요");
			mav.addObject("url", "home");
			return mav;
		}
		ReserveDTO reservedto = reserveService.reserveOne(reserve_idx);
		mav.addObject("reservedto",reservedto);
		return mav;
	}
	
	
	
	//결제완료 및 확인
	@GetMapping("/payCheck/{reserve_idx}")
	public ModelAndView payCheck(@PathVariable("reserve_idx")int reserve_idx, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("/reserve/payCheck");
		ReserveDTO reservedto = reserveService.reserveOne(reserve_idx);
		if(session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해주세요");
			mav.addObject("url", "home");
			return mav;
		}
		
		int price = Integer.parseInt(request.getParameter("price"));
		int payRow = reserveService.paymentByOne(reserve_idx);
//		int minRow = reserveService.minuseSiteCo(reservedto);
		
//		System.out.println(minRow != 0 ? "min업데이트" : "min실패");
		mav.addObject("reservedto",reservedto);
		mav.addObject("price",price);
		return mav;
	}
}
