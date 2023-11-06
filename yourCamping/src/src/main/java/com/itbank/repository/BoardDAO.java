package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.FreeDTO;
import com.itbank.model.ReviewDTO;

@Repository
public interface BoardDAO {

	List<ReviewDTO> selectReviewList();
	
	int insertReview(ReviewDTO dto);
	
	List<ReviewDTO> selectSearchCamping(String keyword);
	
	List<ReviewDTO> selectSearchTitle(String keyword);
	
	List<ReviewDTO> selectSearchWriter(String keyword);

	ReviewDTO selectReviewOne(int review_idx);
	
	String selectReviewImg(int review_idx);
	
	int reviewDelete(int review_idx);

	List<FreeDTO> selectFreeList();

	int insertFree(FreeDTO dto);

	FreeDTO selectFreeOne(int free_table_idx);

	String selectFreeImg(int free_table_idx);

	int freeDelete(int free_table_idx);

	int reviewModify(ReviewDTO dto);

	int freeModify(FreeDTO dto);
}
