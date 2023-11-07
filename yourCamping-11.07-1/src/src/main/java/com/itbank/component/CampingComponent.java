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

	public List<CampingDTO> getCampingList(HashMap<String, Object> params) {
		List<CampingDTO> list = campingDAO.selectList(params);
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
	
	// 검색어/업종 있을 때 출력 개수 구하기
	public int getSearchCnt(HashMap<String, String> param) {
		return campingDAO.selectKeywordCnt(param);
	}

	// 캠핑장명만 가져오기
	public List<CampingDTO> selectFacltnmList() {
		return campingDAO.selectFacltnmList();
	}
}
