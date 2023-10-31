package com.itbank.component;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.model.CampingDTO;
import com.itbank.repository.CampingDAO;

@Component
public class CampingComponent {

	@Autowired
	private CampingDAO campingDAO;

	public int getListCnt() {
		int cnt = campingDAO.selectCnt();
		return cnt;
	}

	public List<CampingDTO> getCampingList1(HashMap<String, Object> param) {
		List<CampingDTO> list = campingDAO.selectList(param);
		return list;
	}
	
	// 대표 이미지
	public CampingDTO selectOne(int camping_idx) {
		campingDAO.plusCamping_viewCount(camping_idx);
		return campingDAO.selectOne(camping_idx);
	}

	// 상세 이미지
	public List<CampingDTO> selectOneImage(int camping_idx) {
		return campingDAO.selectOneImage(camping_idx);
	}
}
