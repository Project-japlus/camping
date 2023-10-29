package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.CampingComponent;
import com.itbank.model.CampingDTO;

@Service
public class CampingService {

	@Autowired
	private CampingComponent campingComponent;

	public int getListCnt() {
		int cnt = campingComponent.getListCnt();
		return cnt;
	}

	public List<CampingDTO> getCampingList(HashMap<String, Object> param) {
		List<CampingDTO> list = campingComponent.getCampingList1(param);
		return list;
	}

	// 대표 이미지
	public CampingDTO selectOne(int camping_idx) {
		return campingComponent.selectOne(camping_idx);
	}

	// 상세 이미지
	public List<CampingDTO> selectOneImage(int camping_idx) {
		return campingComponent.selectOneImage(camping_idx);
	}
}
