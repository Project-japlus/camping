package com.itbank.component;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.model.CampingDTO;
import com.itbank.repository.CampingDAO;

//@Component
public class CampingComponent {

	@Autowired
	private CampingDAO campingDAO;

	// 대표 이미지
	public CampingDTO selectOne(int camping_idx) {
		campingDAO.plusCamping_viewCount(camping_idx);
		return campingDAO.selectOne(camping_idx);
	}

	// 상세 이미지
	public List<CampingDTO> selectOneImage(int camping_idx) {
		return campingDAO.selectOneImage(camping_idx);
	}
	
	// 검색어/업종 있을 때 출력 개수 구하기
//	public int getSearchCnt(HashMap<String, String> param) {
//		return campingDAO.selectKeywordCnt(param);
//	}

	public int campingInsert(CampingDTO dto) {
		return campingDAO.campingInsert(dto);
	}

	public int maxCampingIdx() {
		return campingDAO.maxCampingIdx();
	}

	public int campingImgInsert(CampingDTO dto) {
		return campingDAO.campingImgInsert(dto);
	}

	public int campingPlaceInsert(CampingDTO dto) {
		return campingDAO.campingPlaceInsert(dto);
	}

	public int activityInsert(CampingDTO dto) {
		return campingDAO.activityInsert(dto);
	}

	public int introduceInsert(CampingDTO param) {
		return campingDAO.introduceInsert(param);
	}

	public int internalInsert(CampingDTO dto) {
		return campingDAO.internalInsert(dto);
	}

	public int safetyDeviceInsert(CampingDTO dto) {
		return campingDAO.safetyDeviceInsert(dto);
	}

	public int campingSiteInsert(CampingDTO dto) {
		return campingDAO.campingSiteInsert(dto);
	}

	public int updateCamping(CampingDTO dto) {
		return campingDAO.updateCamping(dto);
	}

	public int updateCampingImg(CampingDTO dto) {
		return campingDAO.updateCampingImg(dto);
	}

	public int updateInfoTwo(CampingDTO dto) {
		return campingDAO.updateInfoTwo(dto);
	}

	public int updateActivity(CampingDTO dto) {
		return campingDAO.updateActivity(dto);
	}

	public int updateIntroduce(CampingDTO dto) {
		return campingDAO.updateIntroduce(dto);
	}

	public int deleteCamping(int maxCampingIdx) {
		return campingDAO.deleteCamping(maxCampingIdx);
	}

	public int deleteCampingImg(CampingDTO dto) {
		return campingDAO.deleteCampingImg(dto);
	}

	public int deleteCampingActivity(int maxCampingIdx) {
		return campingDAO.deleteCampingActivity(maxCampingIdx);
	}

	public int deleteCampingIntoduce(int maxCampingIdx) {
		return campingDAO.deleteCampingIntoduce(maxCampingIdx);
	}

	public int deleteCampingPlace(int maxCampingIdx) {
		return campingDAO.deleteCampingPlace(maxCampingIdx);
	}

	public void deleteCampingInternal(int camping_idx) {
		campingDAO.deleteCampingInternal(camping_idx);
	}

	public void deleteCampingSafetyDevice(int camping_idx) {
		campingDAO.deleteCampingSafetyDevice(camping_idx);
	}

	public void deleteCampingSite(int camping_idx) {
		campingDAO.deleteCampingSite(camping_idx);
	}

	public CampingDTO selectCamping(int camping_idx) {
		return campingDAO.selectCamping(camping_idx);
	}

	public CampingDTO selectCampingTwo(int camping_idx) {
		return campingDAO.selectCampingTwo(camping_idx);
	}

	public int updateInternal(CampingDTO dto) {
		return campingDAO.updateInternal(dto);
	}

	public int updateSafety(CampingDTO dto) {
		return campingDAO.updateSafety(dto);
	}

	public int updateSite(CampingDTO dto) {
		return campingDAO.updateSite(dto);
	}

	public CampingDTO selectCampingThree(int camping_idx) {
		return campingDAO.selectCampingThree(camping_idx);
	}

	public CampingDTO selectOneByImg(int maxCampingIdx) {
		return campingDAO.selectOneByImg(maxCampingIdx);
	}

	public CampingDTO selectInnerImg(int camping_idx) {
		return campingDAO.selectInnerImg(camping_idx);
	}
}
