package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.BoardComponent;
import com.itbank.component.FileComponent;
import com.itbank.model.FreeDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.model.ReviewDTO;

@Service
public class BoardService {

	@Autowired private BoardComponent boardComponent;
	@Autowired private FileComponent fileComponent;
	
	public List<ReviewDTO> selectReviewList() {
		return boardComponent.selectReviewList();
	}
	
	public int insertReview(ReviewDTO dto) {
		if (dto.getUpload().get(0).getSize() != 0) {
			String innerFileName = "";
			for(int i = 0; i < dto.getUpload().size(); i++) {
				String fileName = fileComponent.upload3(dto.getUpload().get(i));
				innerFileName += fileName;
				if (i < dto.getUpload().size() - 1) {
					innerFileName += ",";
				}
			}
			dto.setReview_img(innerFileName);
		}
		return boardComponent.insertReview(dto);
	}
	
	public ReviewDTO selectReviewOne(int review_idx) {
		return boardComponent.selectReviewOne(review_idx);
	}
	
	public int countReviewView(int review_idx) {
		return boardComponent.countReviewView(review_idx);
	}
	
	public int reviewDelete(int review_idx) {
		String fileNames = boardComponent.selectReviewImg(review_idx);
		if (fileNames != null) {
			String[] arr = fileNames.split(",");
			for (int i = 0; i < arr.length; i++) {
				fileComponent.deleteFile3(arr[i]);
			}
		}
		return boardComponent.reviewDelete(review_idx);
	}
	
	public int reviewModify(ReviewDTO dto) {
		return boardComponent.reviewModify(dto);
	}
	
	public List<FreeDTO> selectFreeList() {
		return boardComponent.selectFreeList();
	}
	
	public int insertFree(FreeDTO dto) {
		if (dto.getUpload().isEmpty() == false) {
			String fileName = fileComponent.upload3(dto.getUpload());
			dto.setFree_img(fileName);
		}
		return boardComponent.insertFree(dto);
	}

	public FreeDTO selectFreeOne(int free_table_idx) {
		return boardComponent.selectFreeOne(free_table_idx);
	}
	
	public int countFreeView(int free_table_idx) {
		return boardComponent.countFreeView(free_table_idx);
	}
	
	public int replyCount(int free_table_idx) {
		return boardComponent.replyCount(free_table_idx);
	}
	
	public List<ReplyDTO> selectReply(int free_table_idx) {
		return boardComponent.selectReply(free_table_idx);
	}

	public int insertReply(ReplyDTO dto) {
		return boardComponent.insertReply(dto);
	}
	
	public int deleteReplyOne(ReplyDTO dto) {
		return boardComponent.deleteReplyOne(dto);
	}
	
	public int deleteReplyAll(int free_table_idx) {
		return boardComponent.deleteReplyAll(free_table_idx);
	}
	
	public int freeDelete(int free_table_idx) {
		String fileName = boardComponent.selectFreeImg(free_table_idx);
		if (fileName != null) {
			fileComponent.deleteFile3(fileName);
		}
		return boardComponent.freeDelete(free_table_idx);
	}

	public int freeModify(FreeDTO dto) {
		return boardComponent.freeModify(dto);
	}
	
	public List<ReviewDTO> reviewSortViewCount() {
		return boardComponent.reviewSortViewCount();
	}
	
	public List<FreeDTO> freeSortViewCount() {
		return boardComponent.freeSortViewCount();
	}

	public ReplyDTO selectReplyOne(HashMap<String, Object> map) {
		return boardComponent.selectReplyOne(map);
	}

	public List<ReviewDTO> selectSearchReview(String type, String keyword) {
		List<ReviewDTO> list = null;
		switch(type) {
		case "facltnm":
			list = boardComponent.selectSearchReviewCamping(keyword);
			break;
		case "title":
			list = boardComponent.selectSearchReviewTitle(keyword);
			break;
		case "writer":
			list = boardComponent.selectSearchReviewWriter(keyword);
			break;
		default:
			list = boardComponent.selectReviewList();	
		} 
		return list;
	}

	public List<FreeDTO> selectSearchFree(String type, String keyword) {
		List<FreeDTO> list = null;
		switch(type) {
		case "title":
			list = boardComponent.selectSearchFreeTitle(keyword);
			break;
		case "writer":
			list = boardComponent.selectSearchFreeWriter(keyword);
			break;
		default:
			list = boardComponent.selectFreeList();	
		} 
		return list;
	}
}
