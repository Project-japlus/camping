package com.itbank.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itbank.model.CampingDTO;

public interface CampingDAO {

	CampingDTO selectOne(int camping_idx);

	List<CampingDTO> selectOneImage(int camping_idx);
	
	int getTotalCount();

	List<CampingDTO> selectAll(HashMap<String, Object> param);

	List<CampingDTO> searchKeyword(HashMap<String, Object> param);

	int getSearchTotal(String keyword);

	List<CampingDTO> selectOption(String selectValue);

	List<CampingDTO> search(Map<String, Object> param);

	

	



}
