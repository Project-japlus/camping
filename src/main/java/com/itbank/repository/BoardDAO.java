package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.FreeDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.model.ReviewDTO;

@Repository
public interface BoardDAO {

	List<ReviewDTO> selectReviewList();
	
	int insertReview(ReviewDTO dto);
	
	List<ReviewDTO> selectSearchReviewCamping(String keyword);
	
	List<ReviewDTO> selectSearchReviewTitle(String keyword);
	
	List<ReviewDTO> selectSearchReviewWriter(String keyword);

	ReviewDTO selectReviewOne(int review_idx);
	
	String selectReviewImg(int review_idx);
	
	int reviewDelete(int review_idx);

	List<FreeDTO> selectFreeList();
	
	List<FreeDTO> selectSearchFreeTitle(String keyword);
	
	List<FreeDTO> selectSearchFreeWriter(String keyword);

	int insertFree(FreeDTO dto);

	FreeDTO selectFreeOne(int free_table_idx);
	
	int replyCount(int free_table_idx);
	
	List<ReplyDTO> selectReply(int free_table_idx);
	
	int insertReply(ReplyDTO dto);
	
	int deleteReplyOne(ReplyDTO dto);
	
	int deleteReplyAll(int free_table_idx);

	String selectFreeImg(int free_table_idx);

	int freeDelete(int free_table_idx);

	int reviewModify(ReviewDTO dto);

	int freeModify(FreeDTO dto);
}
