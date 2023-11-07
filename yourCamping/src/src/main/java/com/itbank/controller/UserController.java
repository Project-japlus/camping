package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired private UserService userService;
	
	@PostMapping("/login")
	public String user_login(UserDTO dto, HttpSession session) {
		UserDTO login = userService.user_login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@PostMapping("/bizr_login")
	public String bizr_login(UserDTO dto, HttpSession session) {
		UserDTO login = userService.bizr_login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("/alert");
		mav.addObject("msg", "로그아웃 되었습니다");
		mav.addObject("url", "home");
		return mav;
	}
	
	@PostMapping("/user_join")
	public String user_join(UserDTO dto) {
		int row = userService.join_user(dto);
		System.out.println(row + " 행이 추가되었습니다");
		return "redirect:/";
	}
	
	@PostMapping("bizr_join")
	public String bizr_join(UserDTO dto) {
		int row = userService.join_bizr(dto);
		System.out.println(row + " 행이 추가되었습니다");
		return "redirect:/";
	}

	@GetMapping("/Mypage_check")
	public void MyPage_check() {}
	
	@PostMapping("/Mypage_check")
	public ModelAndView MyPage_check(UserDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session == null) {
			mav.setViewName("redirect:/alert");
			mav.addObject("msg", "로그인 후 이용해 주세요");
			mav.addObject("url", "home");
			return mav;
		}
		// 세션에서 가져온 로그인된 유저 정보
		UserDTO info_login = (UserDTO) session.getAttribute("login");
		//해쉬처리된 입력한 패스워드
		String hash_inputpw = userService.getHash(dto.getUserpw(), info_login.getSalt());
		// 세션의 패스워드
		String session_pw = info_login.getUserpw();
		// 해쉬처리된 입력한 패스워드 와 세션의 비밀번호가 같으면 Mypage로 돌리고 아니면 홈으로 돌리기
		if(hash_inputpw.equals(session_pw)) {
			mav.setViewName("redirect:/user/Mypage");
		} else {
			mav.setViewName("redirect:/user/Mypage_check");
		}
		return mav;
	}
	
	@GetMapping("/Mypage")
	public ModelAndView Mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("login", session.getAttribute("login"));
		return mav;
	}
	
	@GetMapping("/Mypage_modify")
	public void Mypage_modify() {}
}
