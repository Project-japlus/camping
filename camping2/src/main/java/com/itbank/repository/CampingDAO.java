package com.itbank.repository;

import java.util.HashMap;
import java.util.List;
import com.itbank.model.CampingDTO;

public interface CampingDAO {

	CampingDTO selectOne(int camping_idx);

	List<CampingDTO> selectOneImage(int camping_idx);
	
	int getTotalCount();

	List<CampingDTO> selectAll(HashMap<String, Object> param);



}
