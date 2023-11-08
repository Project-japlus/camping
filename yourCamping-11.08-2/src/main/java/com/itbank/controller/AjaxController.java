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
import com.itbank.component.HashComponent;
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
	@Autowired private HashComponent hashComponent;

	// 이메일 인증번호 전송
	@GetMapping("/sendAuthNumber")
	public String sendAuthNumber(String email, HttpSession session) {
		String authNumber = (ran.nextInt(8999999) + 1000000) + "";
		HashMap<String, String> param = new HashMap<>();
		param.put("receiver", email);
		param.put("subject", "인증번호 입니다");
		param.put("content", authNumber);

		int row = mailComponent.sendMimeMessage(param);

		String msg;
		if (row != 1) {
			msg = "인증번호 발송에 실패 했습니다";
		} else {
			msg = "인증번호가 발송 되었습니다.";
			session.setAttribute("authNumber", authNumber);
			session.setMaxInactiveInterval(180);
		}
		return msg;
	}

	// 이메일 인증번호 확인
	@GetMapping("/checkAuthNumber/{userNumber}")
	public String checkAuthNumber(@PathVariable("userNumber") String userNumber, HttpSession session) {
		String sessionNumber = (String) session.getAttribute("authNumber");
		String result = userNumber.equals(sessionNumber) ? "1" : "0";
		return result;
	}

	// 사업자 번호 체크
	@GetMapping("/checkBizrNo")
	public String checkBizrNo(String bizrNo) {
		String result = "0";
		String DbBizrNo = userDAO.getbizrNo(bizrNo);
		if (DbBizrNo != null) {
			result = "1";
		}
		return result;
	}

	// 아이디 중복 체크
	@GetMapping("/checkDuplicateId")
	public String user_ajax(@RequestParam String userid) throws JsonProcessingException {
		String result = userDAO.selectOneByUserid_check(userid);
		if (result == null) {
			return "available";
		} else {
			return "unavailable";
		}
	}

	// MyPageContorller 에서 솔트랑 비밀번호 받아서 해시처리 해주는 함수
	@GetMapping("/Mypage_modify_hash")
	public String Mypage_modify_hash(String now_pw, String session_salt) {
		// now_pw랑 salt를 now_password_hash 로 담아서 해쉬처리
		String now_password_hash = hashComponent.getHash(now_pw, session_salt);

		// 그값 반환
		return now_password_hash;
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

	// 북마크 추가
	@GetMapping("/addBookMark")
	public void addBookMark(@RequestParam HashMap<String, Integer> param, HttpSession session) {
		userDAO.addBookMark(param);
		UserDTO login = (UserDTO) session.getAttribute("login");
		login.setCamping_idx(userDAO.getBookMark(login.getUser_idx()));
	}

	// 북마크 제거
	@GetMapping("/removeBookMark")
	public void removeBookMark(@RequestParam HashMap<String, Integer> param, HttpSession session) {
		userDAO.removeBookMark(param);
		UserDTO login = (UserDTO) session.getAttribute("login");
		login.setCamping_idx(userDAO.getBookMark(login.getUser_idx()));
	}
}
