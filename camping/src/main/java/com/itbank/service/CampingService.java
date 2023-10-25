package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CampingDTO;
import com.itbank.repository.CampingDAO;

@Service
public class CampingService {

	@Autowired private CampingDAO campingDAO;

	public List<CampingDTO> selectAll() {
		return campingDAO.selectAll();
	}

	public CampingDTO selectOne(int camping_idx) {
		return campingDAO.selectOne(camping_idx);
	}
	
	
}
