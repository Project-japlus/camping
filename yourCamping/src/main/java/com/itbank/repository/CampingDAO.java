package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.CampingDTO;

@Repository
public interface CampingDAO {


	int selectCnt();

	List<CampingDTO> selectList(HashMap<String, Object> param);

	CampingDTO selectOne(int camping_idx);

	List<CampingDTO> selectOneImage(int camping_idx);

	void plusCamping_viewCount(int camping_idx);

	int selectKeywordCnt(String keyword);

	int selectIndutyCnt(String induty);

}
