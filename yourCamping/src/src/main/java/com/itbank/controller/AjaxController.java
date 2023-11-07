package com.itbank.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.itbank.component.MailComponent;
import com.itbank.component.WeatherComponent;
import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;
import com.itbank.util.DataType;

@RestController
@RequestMapping("/ajax")
@CrossOrigin
public class AjaxController {
	
	private Random ran = new Random();
	@Autowired private MailComponent mailComponent;
	@Autowired private UserDAO userDAO;
	@Autowired private WeatherComponent weatherComponent;
	
	@GetMapping("/checkAuthNumber/{userNumber}")
	public String checkAuthNumber(@PathVariable("userNumber") String userNumber, HttpSession session) {
		String sessionNumber = (String) session.getAttribute("authNumber");
		String result = userNumber.equals(sessionNumber) ? "1"	: "0";
		return result;
	}
	
	@GetMapping("/sendAuthNumber")
	public String sendAuthNumber(String email, HttpSession session) {
		String authNumber = (ran.nextInt(8999999) + 1000000)  + "";
		HashMap<String, String> param = new HashMap<>();
		param.put("receiver", email);
		param.put("subject", "인증번호 입니다");
		param.put("content", authNumber);
		
		int row = mailComponent.sendMimeMessage(param);
		
		String msg = "인증번호가 발송되었습니다";
		if(row != 1) {
			msg = "인증번호 발송에 실패 했습니다";
			
		}else {
			msg = "인증번호가 발송 되었습니다.";
			session.setAttribute("authNumber", authNumber);
			session.setMaxInactiveInterval(180);
		}
		return msg;
	}
	
	// 일반아이디중복 체크하기
	@GetMapping("/checkDuplicateUserId")
	public String user_ajax(@RequestParam String userid) throws JsonProcessingException {		
		System.out.println("아이디중복 체크할때 받은 값 :" + userid);
		UserDTO dto = userDAO.user_selectOneByUserid_check(userid);
		if(dto == null) {
			return "available";
		} else {
			return "unavailable";
		}
	}
	
	// 사업자아이디중복 체크하기
	@GetMapping("/checkDuplicatebizrId")
	public String bizr_ajax(@RequestParam String userid) throws JsonProcessingException {		
		System.out.println("아이디중복 체크할때 받은 값 :" + userid);
		UserDTO dto = userDAO.bizr_selectOneBybizrid_check(userid);
		if(dto == null) {
			return "available";
		} else {
			return "unavailable";
		}
	}
	
	@GetMapping("/weatherShort/{camping_idx}")
	public String weatherShort(@PathVariable("camping_idx") int camping_idx) throws IOException {
		String jsonData = weatherComponent.getStringShort(DataType.JSON, camping_idx);
		return jsonData;
	}
		
	@GetMapping("/weatherMid/{camping_idx}")
	public String weatherMid(@PathVariable("camping_idx") int camping_idx) throws IOException {
		String jsonData = weatherComponent.getStringMid(DataType.JSON, camping_idx);
		return jsonData;
	}
	
	@GetMapping("/tempMid/{camping_idx}")
	public String tempMid(@PathVariable("camping_idx") int camping_idx) throws IOException {
		String jsonData = weatherComponent.getStringTemp(DataType.JSON, camping_idx);
		return jsonData;
	}
}
