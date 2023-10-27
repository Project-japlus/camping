package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.CampingDTO;

@Repository
public interface CampingDAO {

	List<CampingDTO> selectList(int pageNo);

	int selectCnt();

	List<CampingDTO> selectList1(HashMap<String, Object> param);

}
