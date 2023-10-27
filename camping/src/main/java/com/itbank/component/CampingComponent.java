package com.itbank.component;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.model.CampingDTO;
import com.itbank.repository.CampingDAO;

@Component
public class CampingComponent {
	
	@Autowired private CampingDAO campingDAO;
	
	public List<CampingDTO> getCampingList(int pageNo) {
		List<CampingDTO> list = campingDAO.selectList(pageNo);
		return list;
	}

	public int getListCnt() {
		int cnt = campingDAO.selectCnt();
		return cnt;
	}

	public List<CampingDTO> getCampingList1(HashMap<String, Object> param) {
		List<CampingDTO> list = campingDAO.selectList1(param);
		return list;
	}
	
}
