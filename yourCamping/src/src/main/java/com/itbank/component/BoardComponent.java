package com.itbank.component;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.model.FreeDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.repository.BoardDAO;

@Component
public class BoardComponent {

	@Autowired private BoardDAO boardDAO;
	
	public List<ReviewDTO> selectReviewList() {
		List<ReviewDTO> list = boardDAO.selectReviewList();
		return list;
	}
	
	public int insertReview(ReviewDTO dto) {
		return boardDAO.insertReview(dto);
	}
	
	public List<ReviewDTO> selectSearchCamping(String keyword) {
		return boardDAO.selectSearchCamping(keyword);
	}
	
	public List<ReviewDTO> selectSearchTitle(String keyword) {
		return boardDAO.selectSearchTitle(keyword);
	}
	
	public List<ReviewDTO> selectSearchWriter(String keyword) {
		return boardDAO.selectSearchWriter(keyword);
	}

	public ReviewDTO selectReviewOne(int review_idx) {
		return boardDAO.selectReviewOne(review_idx);
	}
	
	public String selectReviewImg(int review_idx) {
		return boardDAO.selectReviewImg(review_idx);
	}
	
	public int reviewDelete(int review_idx) {
		return boardDAO.reviewDelete(review_idx);
	}
	
	public int reviewModify(ReviewDTO dto) {
		return boardDAO.reviewModify(dto);
	}

	public List<FreeDTO> selectFreeList() {
		return boardDAO.selectFreeList();
	}

	public int insertFree(FreeDTO dto) {
		return boardDAO.insertFree(dto);
	}

	public FreeDTO selectFreeOne(int free_table_idx) {
		return boardDAO.selectFreeOne(free_table_idx);
	}

	public String selectFreeImg(int free_table_idx) {
		return boardDAO.selectFreeImg(free_table_idx);
	}

	public int freeDelete(int free_table_idx) {
		return boardDAO.freeDelete(free_table_idx);
	}

	public int freeModify(FreeDTO dto) {
		return boardDAO.freeModify(dto);
	}
}
