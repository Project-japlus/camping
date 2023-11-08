package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CampingDTO;
import com.itbank.model.FreeDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.model.ReviewLikeDTO;
import com.itbank.model.UserDTO;
import com.itbank.service.BoardService;
import com.itbank.service.CampingService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService boardService;
	@Autowired private CampingService campingService;
	
	@GetMapping("/reviewList")
	public ModelAndView reviewList() {
		ModelAndView mav = new ModelAndView("/board/reviewList");
		List<ReviewDTO> list = boardService.selectReviewList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/reviewSearch")
	public ModelAndView reviewSearch(@RequestParam("type") String type,@RequestParam("keyword") String keyword) {
		ModelAndView mav = new ModelAndView("/board/reviewList");
		List<ReviewDTO> list = null;
		if (type.equals("facltnm")) {
			list = boardService.selectSearchReviewCamping(keyword);
		}
		else if (type.equals("title")) {
			list = boardService.selectSearchReviewTitle(keyword);
		}
		else if (type.equals("writer")) {
			list = boardService.selectSearchReviewWriter(keyword);
		}
		else  {
			list = boardService.selectReviewList();
		}
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/reviewWrite")
	public ModelAndView reviewWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("login") == null) {
			mav.setViewName("/alert");
			mav.addObject("msg", "로그인 후 이용해주세요");
			mav.addObject("url", "home");
		}
		List<CampingDTO> list = campingService.selectFacltnmList();
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/reviewWrite")
	public String reviewWrite(ReviewDTO dto, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login != null) {
			dto.setUser_idx(login.getUser_idx());
			boardService.insertReview(dto);
		}
		return "redirect:/board/reviewList";
	}
	
	@GetMapping("/reviewView/{review_idx}")
	public ModelAndView reviewView(@PathVariable("review_idx") int review_idx) {
		ModelAndView mav= new ModelAndView("/board/reviewView");
		boardService.countReviewView(review_idx);
		ReviewDTO dto = boardService.selectReviewOne(review_idx);
		String[] list = null;
		if (dto.getReview_img() != null) {
			list = dto.getReview_img().split(",");
		}
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/reviewLike/{review_idx}")
	public String reviewLike(@PathVariable("review_idx") int review_idx, HttpSession session) {
		ReviewLikeDTO dto = new ReviewLikeDTO();
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login != null) {
			dto.setUser_idx(login.getUser_idx());
			dto.setReview_idx(review_idx);
			boardService.countReviewLike(dto);
		}
		return "redirect:/board/reviewView/" + review_idx;
	}
	
	@GetMapping("/reviewDelete/{review_idx}")
	public String reviewDelete(@PathVariable("review_idx") int review_idx) {
		boardService.reviewDelete(review_idx);
		return "redirect:/board/reviewList";
	}
	
	@GetMapping("/reviewModify/{review_idx}")
	public ModelAndView reviewModify(@PathVariable("review_idx") int review_idx) {
		ModelAndView mav= new ModelAndView("/board/reviewModify");
		ReviewDTO dto = boardService.selectReviewOne(review_idx);
		List<CampingDTO> list = campingService.selectFacltnmList();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/reviewModify/{review_idx}")
	public String reviewModify(@PathVariable("review_idx") int review_idx, ReviewDTO dto, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login != null) {
			dto.setUser_idx(login.getUser_idx());
			boardService.reviewModify(dto);
		}
		return "redirect:/board/reviewView/" + review_idx;
	}
	
	@GetMapping("/freeList")
	public ModelAndView freeList() {
		ModelAndView mav = new ModelAndView("/board/freeList");
		List<FreeDTO> list = boardService.selectFreeList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/freeSearch")
	public ModelAndView freeSearch(@RequestParam("type") String type,@RequestParam("keyword") String keyword) {
		ModelAndView mav = new ModelAndView("/board/freeList");
		List<FreeDTO> list = null;
		if (type.equals("title")) {
			list = boardService.selectSearchFreeTitle(keyword);
		}
		else if (type.equals("writer")) {
			list = boardService.selectSearchFreeWriter(keyword);
		}
		else  {
			list = boardService.selectFreeList();
		}
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/freeWrite")
	public void freeWrite() {}
	
	@PostMapping("/freeWrite")
	public String freeWrite(FreeDTO dto, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login != null) {
			dto.setUser_idx(login.getUser_idx());
			boardService.insertFree(dto);
		}
		return "redirect:/board/freeList";
	}
	
	@GetMapping("/freeView/{free_table_idx}")
	public ModelAndView freeView(@PathVariable("free_table_idx") int free_table_idx) {
		ModelAndView mav= new ModelAndView("/board/freeView");
		boardService.countFreeView(free_table_idx);
		FreeDTO dto = boardService.selectFreeOne(free_table_idx);
		List<ReplyDTO> list = boardService.selectReply(free_table_idx);
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/freeView/{free_table_idx}")
	public String insertReply(@PathVariable("free_table_idx") int free_table_idx, ReplyDTO dto, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login != null) {
			dto.setUser_idx(login.getUser_idx());
			dto.setFree_table_idx(free_table_idx);
			boardService.insertReply(dto);
		}
		return "redirect:/board/freeView/" + free_table_idx;
	}
	
	@GetMapping("/freeView/{free_table_idx}/deleteReply")
	public String deleteReply(@PathVariable("free_table_idx") int free_table_idx, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		ReplyDTO dto = null;
		HashMap<String, Object> map = new HashMap<>();
		
		if (login != null) {
			map.put("free_table_idx", free_table_idx);
			map.put("user_idx", login.getUser_idx());
			dto = boardService.selectReplyOne(map);
			boardService.deleteReplyOne(dto);
		}
		return "redirect:/board/freeView/" + free_table_idx;
	}
	
	@GetMapping("/freeDelete/{free_table_idx}")
	public String freeDelete(@PathVariable("free_table_idx") int free_table_idx) {
		boardService.deleteReplyAll(free_table_idx);
		boardService.freeDelete(free_table_idx);
		return "redirect:/board/freeList";
	}
	
	@GetMapping("/freeModify/{free_table_idx}")
	public ModelAndView freeModify(@PathVariable("free_table_idx") int free_table_idx) {
		ModelAndView mav= new ModelAndView("/board/freeModify");
		FreeDTO dto = boardService.selectFreeOne(free_table_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/freeModify/{free_table_idx}")
	public String freeModify(@PathVariable("free_table_idx") int free_table_idx, FreeDTO dto, HttpSession session) {
		int user_idx = ((UserDTO)session.getAttribute("login")).getUser_idx();
		dto.setUser_idx(user_idx);
		boardService.freeModify(dto);
		return "redirect:/board/freeView/" + free_table_idx;
	}
}
