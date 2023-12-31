package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BookmarkDTO;
import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 로그인
	@PostMapping("/login")
	public ModelAndView user_login(UserDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/");
		UserDTO login = null;
		// 사업자 로그인
		if (dto.isRemember_bizr()) {
			login = userService.bizr_login(dto);
		} else {
			// 일반 로그인
			login = userService.user_login(dto);
		}
		if (login != null) {
			login.setCamping_idx(userService.getBookMark(login.getUser_idx()));
			login.setReview_idx(userService.getReviewLike(login.getUser_idx()));
			session.setAttribute("login", login);
		} else {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인에 실패하였습니다");
			mav.addObject("url", "home");
		}
		return mav;
	}

	// 로그아웃 : 알람 전용 페이지로 이동해서 알람 띄우기 위한 msg와, 다른 페이지로 이동하기 위한 url을 가져간다
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("/alert");
		mav.addObject("msg", "로그아웃 되었습니다");
		mav.addObject("url", "home");
		return mav;
	}

	// 회원가입 : 회원가입 폼은 모달 사용

	// 일반 사용자 회원가입
	@PostMapping("/user_join")
	public ModelAndView user_join(UserDTO dto) {
		ModelAndView mav = new ModelAndView("/alert");
		int row = userService.join_user(dto);
		System.out.println("일반 " + row + " 행이 추가되었습니다");
		if (row != 0) {
			mav.addObject("msg", "회원가입에 성공하셨습니다");
			mav.addObject("url", "home");
		} else {
			mav.addObject("msg", "회원가입에 실패하였습니다");
			mav.addObject("url", "home");
		}
		return mav;
	}

	// 사업자 회원가입
	@PostMapping("bizr_join")
	public ModelAndView bizr_join(UserDTO dto) {
		ModelAndView mav = new ModelAndView("/alert");
		int row = userService.join_bizr(dto);
		System.out.println("사업자 " + row + " 행이 추가되었습니다");
		if (row != 0) {
			mav.addObject("msg", "회원가입에 성공하셨습니다");
			mav.addObject("url", "home");
		} else {
			mav.addObject("msg", "회원가입에 실패하였습니다");
			mav.addObject("url", "home");
		}
		return mav;
	}

	// 마이페이지

	// 마이페이지 이동 전 비밀번호 확인하는 창으로 이동
	@GetMapping("/Mypage_check")
	public ModelAndView MyPage_check(HttpSession session, Integer camping_idx) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해 주세요");
			mav.addObject("url", "home");
		}
		if (camping_idx != null) {
			mav.addObject("camping_idx", camping_idx);
		}
		return mav;
	}

	//
	@PostMapping("/Mypage_check")
	public ModelAndView MyPage_check(UserDTO dto, HttpSession session, Integer camping_idx) {
		ModelAndView mav = new ModelAndView();
//		// 세션에서 가져온 로그인된 유저 정보
		UserDTO info_login = (UserDTO) session.getAttribute("login");
		// 해쉬처리된 입력한 패스워드
		String hash_inputpw = userService.getHash(dto.getUserpw(), info_login.getSalt());
		// 세션의 패스워드
		String session_pw = info_login.getUserpw();
		// 해쉬처리된 입력한 패스워드 와 세션의 비밀번호가 같으면 Mypage로 돌리고 아니면 홈으로 돌리기
		if (camping_idx != null) {
			if (hash_inputpw.equals(session_pw)) {
				mav.setViewName("redirect:/bizr/campingDelete/" + camping_idx);
			} else {
				mav.setViewName("redirect:/user/Mypage_check");
				mav.addObject("camping_idx", camping_idx);
			}
		} else {
			if (hash_inputpw.equals(session_pw)) {
				mav.setViewName("redirect:/user/Mypage");
			} else {
				mav.setViewName("/alert");
				mav.addObject("msg", "비밀번호를 확인해 주세요");
				mav.addObject("url", "MpC");
			}
		}
		return mav;
	}

	@GetMapping("/Mypage")
	public ModelAndView Mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해 주세요");
			mav.addObject("url", "home");
		}
		int user_idx = login.getUser_idx();
		// (11/8)마이페이지에서 내가 예약한 캠핑장 가져오는 메서드
		List<ReserveDTO> reserveInfo = userService.getReserveInfo(user_idx);
		List<BookmarkDTO> bookmarkInfo = userService.getBookmarkInfo(user_idx);
		List<CampingDTO> bizrInfo = userService.getbizrInfo(user_idx);
		mav.addObject("reservelist", reserveInfo);
		mav.addObject("bookmarklist", bookmarkInfo);
		mav.addObject("bizrlist", bizrInfo);
		return mav;
	}

	@GetMapping("/Mypage_modify")
	public ModelAndView Mypage_modify(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해 주세요");
			mav.addObject("url", "home");
		}
		return mav;
	}

	// 일반, 사용자 이메일 수정하기
	@PostMapping("/changeEmailForm")
	public ModelAndView modify_email(UserDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("/alert");
		// 세션에 로그인 정보 가져오기
		UserDTO login = (UserDTO) session.getAttribute("login");
		// 세션에 저장된 idx를 정수 변수에 넣고 dto에 넣기
		dto.setUser_idx(login.getUser_idx());

		// 세션에서 받아온 사업자 번호를 dto에 넣기
		String bizrno = login.getBizrno();

		// 사업자 번호가 없으면 user_modify_email
		// 실행 없으면 bizr_modify_email 실행
		if (bizrno == null) {
			userService.user_modify_email(dto);
			login = userService.user_login(login);
		} else {
			userService.bizr_modify_email(dto);
			login = userService.bizr_login(login);
		}
		session.setAttribute("login", login);
		mav.addObject("msg", "이메일이 변경되었습니다");
		mav.addObject("url", "Mypage_modify");
		return mav;
	}

	// 비밀번호를 수정할 함수
	@PostMapping("modify_userpw")
	public ModelAndView Mypage_modify_password(UserDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("/alert");

		// UserDTO 타입의 로그인 이란 이름이 변수 선언 (세션에서 로그인 정보 가져오고)
		UserDTO login = (UserDTO) session.getAttribute("login");
		// login 에서 bizrno 번호 가져오기
		String bizrno = login.getBizrno();

		// 만약 사업자 번호가 null 이면 일반 사용자 비번 수정
		if (bizrno == null) {
			userService.user_modify_pw(dto);
		} else {
			// 만약 사업자 번호가 null 이 아니면 일반 사용자 비번 수정
			userService.bizr_modify_pw(dto);
		}
		mav.addObject("msg", "비밀번호가 변경되었습니다. 다시 로그인 해주세요");
		mav.addObject("url", "logout");
		return mav;
	}

	// 회원탈퇴
	@GetMapping("/leave/{user_idx}")
	public ModelAndView leave(@PathVariable("user_idx") int user_idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/alert");
		int row = userService.user_leave(user_idx);
		if (row != 0) {
			session.invalidate();
			mav.addObject("msg", "탈퇴되었습니다.");
			mav.addObject("url", "home");
		}
		return mav;
	}
}
