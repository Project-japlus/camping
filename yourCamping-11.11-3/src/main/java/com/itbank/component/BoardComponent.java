package com.itbank.component;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.model.FreeDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.model.ReviewDTO;
import com.itbank.repository.BoardDAO;

@Component
public class BoardComponent {

	@Autowired private BoardDAO boardDAO;
	
	public List<ReviewDTO> selectReviewList(HashMap<String, Object> map) {
		List<ReviewDTO> list = boardDAO.selectReviewList(map);
		return list;
	}
	
	public int countReviewList() {
		return boardDAO.countReviewList();
	}
	
	public int insertReview(ReviewDTO dto) {
		return boardDAO.insertReview(dto);
	}
	
	public List<ReviewDTO> selectSearchReviewCamping(HashMap<String, Object> map) {
		return boardDAO.selectSearchReviewCamping(map);
	}
	
	public int countSearchReviewCamping(String keyword) {
		return boardDAO.countSearchReviewCamping(keyword);
	}
	
	public List<ReviewDTO> selectSearchReviewTitle(HashMap<String, Object> map) {
		return boardDAO.selectSearchReviewTitle(map);
	}
	
	public int countSearchReviewTitle(String keyword) {
		return boardDAO.countSearchReviewTitle(keyword);
	}
	
	public List<ReviewDTO> selectSearchReviewWriter(HashMap<String, Object> map) {
		return boardDAO.selectSearchReviewWriter(map);
	}
	
	public int countSearchReviewWriter(String keyword) {
		return boardDAO.countSearchReviewWriter(keyword);
	}

	public ReviewDTO selectReviewOne(int review_idx) {
		return boardDAO.selectReviewOne(review_idx);
	}
	
	public int countReviewView(int review_idx) {
		return boardDAO.countReviewView(review_idx);
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

	public List<FreeDTO> selectFreeList(HashMap<String, Object> map) {
		return boardDAO.selectFreeList(map);
	}

	public int countFreeList() {
		return boardDAO.countFreeList();
	}
	
	public List<FreeDTO> selectSearchFreeTitle(HashMap<String, Object> map) {
		return boardDAO.selectSearchFreeTitle(map);
	}
	
	public int countSearchFreeTitle(String keyword) {
		return boardDAO.countSearchFreeTitle(keyword);
	}
	
	public List<FreeDTO> selectSearchFreeWriter(HashMap<String, Object> map) {
		return boardDAO.selectSearchFreeWriter(map);
	}

	public int countSearchFreeWriter(String keyword) {
		return boardDAO.countSearchFreeWriter(keyword);
	}
	
	public int insertFree(FreeDTO dto) {
		return boardDAO.insertFree(dto);
	}

	public FreeDTO selectFreeOne(int free_table_idx) {
		return boardDAO.selectFreeOne(free_table_idx);
	}

	public int countFreeView(int free_table_idx) {
		return boardDAO.countFreeView(free_table_idx);
	}
	
	public int replyCount(int free_table_idx) {
		return boardDAO.replyCount(free_table_idx);
	}
	
	public List<ReplyDTO> selectReply(int free_table_idx) {
		return boardDAO.selectReply(free_table_idx);
	}
	
	public int insertReply(ReplyDTO dto) {
		return boardDAO.insertReply(dto);
	}
	
	public int deleteReplyOne(ReplyDTO dto) {
		return boardDAO.deleteReplyOne(dto);
	}
	
	public int deleteReplyAll(int free_table_idx) {
		return boardDAO.deleteReplyAll(free_table_idx);
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
	
	public List<ReviewDTO> reviewSortViewCount() {
		return boardDAO.reviewSortViewCount();
	}
	
	public List<FreeDTO> freeSortViewCount() {
		return boardDAO.freeSortViewCount();
	}

	public ReplyDTO selectReplyOne(HashMap<String, Object> map) {
		return boardDAO.selectReplyOne(map);
	}

}
