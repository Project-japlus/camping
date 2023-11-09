package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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

	int countReviewView(int review_idx);

	String selectReviewImg(int review_idx);

	int reviewDelete(int review_idx);

	List<FreeDTO> selectFreeList();

	List<FreeDTO> selectSearchFreeTitle(String keyword);

	List<FreeDTO> selectSearchFreeWriter(String keyword);

	int insertFree(FreeDTO dto);

	FreeDTO selectFreeOne(int free_table_idx);

	int countFreeView(int free_table_idx);

	int replyCount(int free_table_idx);

	List<ReplyDTO> selectReply(int free_table_idx);

	int insertReply(ReplyDTO dto);

	int deleteReplyOne(ReplyDTO dto);

	int deleteReplyAll(int free_table_idx);

	String selectFreeImg(int free_table_idx);

	int freeDelete(int free_table_idx);

	int reviewModify(ReviewDTO dto);

	int freeModify(FreeDTO dto);

	List<ReviewDTO> reviewSortViewCount();

	List<FreeDTO> freeSortViewCount();

	ReplyDTO selectReplyOne(HashMap<String, Object> map);

	// 리뷰 추천 추가
	@Insert("insert into review_like values (#{user_idx}, #{review_idx})")
	void addReviewLike(HashMap<String, Integer> param);

	// 리뷰 추천 제거
	@Delete("delete review_like where user_idx = #{user_idx} and review_idx = #{review_idx}")
	void removeReviewLike(HashMap<String, Integer> param);
	
	// 리뷰 추천수
	@Select("select count(*) from review_like where review_idx = #{review_idx}")
	int getReviewLikeCnt(int review_idx);


}
