package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CampingDTO;
import com.itbank.repository.CampingDAO;

@Service
public class CampingService {

	@Autowired private CampingDAO campingDAO;

	// 대표 이미지
	public CampingDTO selectOne(int camping_idx) {
		return campingDAO.selectOne(camping_idx);
	}

	// 상세 이미지
	public List<CampingDTO> selectOneImage(int camping_idx) {
		return campingDAO.selectOneImage(camping_idx);
	}

	public int getTotalCount() {
		return campingDAO.getTotalCount();
	}

	public List<CampingDTO> selectAll(HashMap<String, Object> param) {
		return campingDAO.selectAll(param);
	}

	public List<CampingDTO> searchKeyword(HashMap<String, Object> param) {
		return campingDAO.searchKeyword(param);
	}

	public int getSearchTotal(String keyword) {
		return campingDAO.getSearchTotal(keyword);
	}





	


	

	

	
	




	
	
}
