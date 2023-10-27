package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.CampingComponent;
import com.itbank.model.CampingDTO;

@Service
public class CampingService {
	
	@Autowired private CampingComponent campingComponent;
	
	public List<CampingDTO> paging(int pageNo) {
		pageNo = pageNo * 10 - 10;	// 1 * 10 - 10 = 0
		List<CampingDTO> list = campingComponent.getCampingList(pageNo);
		return list;
	}

	public Object getListCnt() {
		int cnt = campingComponent.getListCnt();
		return cnt;
	}

}
