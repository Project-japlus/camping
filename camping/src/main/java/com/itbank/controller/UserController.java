package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
public class UserController {
	
	@Autowired private UserService userSerivce;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/user_login")
	public String user_login(UserDTO dto, HttpSession session) {
		UserDTO login = userSerivce.user_login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@PostMapping("/bizr_login")
	public String bizr_login(UserDTO dto, HttpSession session) {
		UserDTO login = userSerivce.bizr_login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

}
