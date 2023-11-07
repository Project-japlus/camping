package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.BoardComponent;
import com.itbank.component.FileComponent;
import com.itbank.model.FreeDTO;
import com.itbank.model.ReviewDTO;

@Service
public class BoardService {

	@Autowired private BoardComponent boardComponent;
	@Autowired private FileComponent fileComponent;
	
	public List<ReviewDTO> selectReviewList() {
		return boardComponent.selectReviewList();
	}
	
	public int insertReview(ReviewDTO dto) {
		if (dto.getUpload() != null) {
			String innerFileName = "";
			for(int i = 0; i < dto.getUpload().length; i++) {
				String fileName = fileComponent.upload3(dto.getUpload()[i]);
				innerFileName += fileName;
				if (i < dto.getUpload().length - 1) {
					innerFileName += ",";
				}
			}
			dto.setReview_img(innerFileName);
		}
		return boardComponent.insertReview(dto);
	}
	
	public List<ReviewDTO> selectSearchCamping(String keyword) {
		return boardComponent.selectSearchCamping(keyword);
	}
	
	public List<ReviewDTO> selectSearchTitle(String keyword) {
		return boardComponent.selectSearchTitle(keyword);
	}
	
	public List<ReviewDTO> selectSearchWriter(String keyword) {
		return boardComponent.selectSearchWriter(keyword);
	}

	public ReviewDTO selectReviewOne(int review_idx) {
		return boardComponent.selectReviewOne(review_idx);
	}
	
	public int reviewDelete(int review_idx) {
		String fileNames = boardComponent.selectReviewImg(review_idx);
		if (fileNames != null) {
			String[] arr = fileNames.split(",");
			for (int i = 0; i < arr.length; i++) {
				fileComponent.deleteFile(arr[i]);
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

	public int freeDelete(int free_table_idx) {
		String fileName = boardComponent.selectFreeImg(free_table_idx);
		if (fileName != null) {
			fileComponent.deleteFile(fileName);
		}
		return boardComponent.freeDelete(free_table_idx);
	}

	public int freeModify(FreeDTO dto) {
		return boardComponent.freeModify(dto);
	}
}
