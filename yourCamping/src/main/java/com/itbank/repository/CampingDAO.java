package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.CampingDTO;

@Repository
public interface CampingDAO {

	int getListCnt();

	List<CampingDTO> getCampingList(HashMap<String, Object> params);

	CampingDTO selectOne(int camping_idx);

	List<CampingDTO> selectOneImage(int camping_idx);

	void plusCamping_viewCount(int camping_idx);

	int getSearchCnt(HashMap<String, String> param);

	String selectAreaCode(int camping_idx);

	double selectMapY(int camping_idx);

	double selectMapX(int camping_idx);
	
	int campingInsert(CampingDTO dto);
	
	int maxCampingIdx();

	int campingImgInsert(CampingDTO dto);

	int campingPlaceInsert(CampingDTO dto);

	int activityInsert(CampingDTO param);

	int introduceInsert(CampingDTO param);

	int internalInsert(CampingDTO dto);

	int safetyDeviceInsert(CampingDTO dto);

	int campingSiteInsert(CampingDTO dto);

	int updateCamping(CampingDTO dto);

	int updateCampingImg(CampingDTO dto);

	int updateInfoTwo(CampingDTO dto);

	int updateActivity(CampingDTO dto);

	int updateIntroduce(CampingDTO dto);

	int deleteCamping(int maxCampingIdx);

	int deleteCampingImg(int maxCampingIdx);

	int deleteCampingActivity(int maxCampingIdx);

	int deleteCampingPlace(int maxCampingIdx);

	CampingDTO selectCamping(int camping_idx);

	CampingDTO selectCampingTwo(int camping_idx);

	int updateInternal(CampingDTO dto);

	int updateSafety(CampingDTO dto);

	int updateSite(CampingDTO dto);

	CampingDTO selectCampingThree(int camping_idx);

	List<CampingDTO> selectOneByImg(int maxCampingIdx);

	CampingDTO selectInnerImg(int camping_idx);

	List<CampingDTO> selectFacltnmList();
	
	List<CampingDTO> campingSortViewCount();

	int campingFirstInsert(CampingDTO dto);

	void updateConfirm(int camping_idx);
}
