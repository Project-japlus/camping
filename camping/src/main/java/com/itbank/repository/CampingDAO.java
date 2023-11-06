package com.itbank.repository;

import java.util.List;

import com.itbank.model.CampingDTO;


public interface CampingDAO {

	List<CampingDTO> selectAll();

	CampingDTO selectOne(int camping_idx);

}
