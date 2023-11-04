package com.itbank.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.itbank.model.CampingDTO;
import com.itbank.model.Camping_siteDTO;
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
	public ModelAndView reservation(@PathVariable("camping_idx")int camping_idx, ReserveDTO rdto) {
		ModelAndView mav = new ModelAndView("reservation");		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("camping_idx", camping_idx);
		param.put("reserve_str_date", rdto.getReserve_str_date());
		param.put("reserve_end_date", rdto.getReserve_end_date());
		
		CampingDTO cdto =reserveService.selectOne(camping_idx);	
		int aSco=	reserveService.selectA(param);
		int bSco=	reserveService.selectB(param);
		int	cSco=	reserveService.selectC(param);
		
		System.out.println("aSco:"+aSco);
		System.out.println("bSco:"+bSco);
		System.out.println("cSco:"+cSco);
		
		
//		List<ReserveDTO> list = reserveService.reserveList(camping_idx);
		System.out.println(cdto.getCamping_idx());
		int aCount = cdto.getSitemg1co()-aSco;
		int bCount = cdto.getSitemg2co()-bSco;
		int cCount = cdto.getSitemg3co()-cSco;
		
		System.out.println(cdto.getSitemg1co()); 
		System.out.println("aCount : " + aCount);
		System.out.println("bCount : " + bCount);
		System.out.println("cCount : " + cCount);
		mav.addObject("cdto",cdto);
		mav.addObject("rdto",rdto);
		mav.addObject("aCount",aCount);
		mav.addObject("bCount",bCount);
		mav.addObject("cCount",cCount);
		return mav;
	}
	
	
	//ReserveDTO 예약 넣기
	@PostMapping("/reservation/{camping_idx}")
	public String reservation(ReserveDTO reservedto , HttpSession session) {
		System.out.println(reservedto.getReserve_end_date());
		System.out.println(reservedto.getReserve_str_date());
		System.out.println(reservedto.getCamping_idx());;
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
		return "redirect:/confirm/" + reservedto.getReserve_idx();
	}
	
	//예약자 확인 페이지
	@GetMapping("/confirm/{reserve_idx}")
	public ModelAndView confirm(@PathVariable("reserve_idx")int reserve_idx) {
		ModelAndView mav = new ModelAndView("confirm");
		ReserveDTO reservedto = reserveService.reserveOne(reserve_idx);
		mav.addObject("reservedto",reservedto);
		return mav;
	}
	
	
	
	//결제완료 및 확인
	@GetMapping("/payCheck/{reserve_idx}")
	public ModelAndView payCheck(@PathVariable("reserve_idx")int reserve_idx, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("payCheck");
		ReserveDTO reservedto = reserveService.reserveOne(reserve_idx);
		
		int price = Integer.parseInt(request.getParameter("price"));
		int payRow = reserveService.paymentByOne(reserve_idx);
//		int minRow = reserveService.minuseSiteCo(reservedto);
		
		System.out.println(payRow != 0 ? "pay업데이트" : "pay실패");
//		System.out.println(minRow != 0 ? "min업데이트" : "min실패");
		mav.addObject("reservedto",reservedto);
		mav.addObject("price",price);
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
