package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
public class JoinController {

	@Autowired private UserService campingService;


	@GetMapping("join1")
	public void join1() {}
	
	@GetMapping("join2")
	public void join2() {}
	
	@PostMapping("/user_join")
	public String user_join(UserDTO dto) {
		int row = campingService.join_user(dto);
		System.out.println(row + "행이 추가되었습니다");
		return "redirect:/";
	}
	
	@PostMapping("bizr_join")
	public String bizr_join(UserDTO dto) {
		int row = campingService.join_bizr(dto);
		System.out.println(row + "행이 추가되었습니다");
		return "redirect:/";
	}
	
}
