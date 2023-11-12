package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.FileComponent;
import com.itbank.model.CampingDTO;
import com.itbank.repository.CampingDAO;

@Service
public class CampingService {

	@Autowired
	private CampingDAO campingDAO;
	@Autowired
	private FileComponent fileComponent;

	public int getListCnt() {
		int cnt = campingDAO.getListCnt();
		return cnt;
	}

	public List<CampingDTO> getCampingList(HashMap<String, Object> params) {
		List<CampingDTO> list = campingDAO.getCampingList(params);
		return list;
	}

	// 대표 이미지
	public CampingDTO selectOne(int camping_idx) {
		campingDAO.plusCamping_viewCount(camping_idx);
		return campingDAO.selectOne(camping_idx);
	}

	// 상세 이미지
	public List<CampingDTO> selectOneImage(int camping_idx) {
		return campingDAO.selectOneImage(camping_idx);
	}

	// 검색어/업종이 있을 때 개수 구하기
	public int getSearchCnt(HashMap<String, String> param) {
		return campingDAO.getSearchCnt(param);
	}

	public int campingInsert(CampingDTO dto) {
		if (dto.getInduty() == null) {
			dto.setInduty("일반야영장");
		}
		return campingDAO.campingInsert(dto);
	}

	public int maxCampingIdx() {
		return campingDAO.maxCampingIdx();
	}

	public int campingImgInsert(CampingDTO dto) {
		int row = 0;
		String fileName = fileComponent.upload(dto.getUpload1());
		dto.setFirst_img(fileName);
		row = campingDAO.campingFirstInsert(dto);

		for (int i = 0; i < dto.getUpload2().length; i++) {
			String inner_img = fileComponent.upload2(dto.getUpload2()[i]);
			CampingDTO inner = new CampingDTO();
			inner.setCamping_idx(dto.getCamping_idx());
			inner.setInner_img(inner_img);
			row = campingDAO.campingImgInsert(inner);
		}
		return row;
	}

	public int campingPlaceInsert(CampingDTO dto) {
		return campingDAO.campingPlaceInsert(dto);
	}

	public int activityInsert(CampingDTO dto) {
		if (dto.getExprnprogrm() != null) {
			dto.setExprnprogrmat("Y");
		} else {
			dto.setExprnprogrmat("N");
		}
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
		String fileName = fileComponent.upload(dto.getUpload1());
		dto.setFirst_img(fileName);
		
		for (int i = 0; i < dto.getUpload2().length; i++) {
			String inner_img = fileComponent.upload2(dto.getUpload2()[i]);
			CampingDTO inner = new CampingDTO();
			inner.setCamping_idx(dto.getCamping_idx());
			inner.setInner_img(inner_img);
			campingDAO.updateCampingImg(inner);
		}
		return campingDAO.updateCampingImg(dto);
	}

	public int updateInfoTwo(CampingDTO dto) {
		return campingDAO.updateInfoTwo(dto);
	}

	public int updateActivity(CampingDTO dto) {
		if (dto.getExprnprogrm() != null) {
			dto.setExprnprogrmat("Y");
		} else {
			dto.setExprnprogrmat("N");
		}
		return campingDAO.updateActivity(dto);
	}

	public int updateIntroduce(CampingDTO dto) {
		return campingDAO.updateIntroduce(dto);
	}

	// 이전
	public int deleteCamping(int maxCampingIdx) {
		return campingDAO.deleteCamping(maxCampingIdx);
	}

	public int deleteCampingImg(int maxCampingIdx) {
		List<CampingDTO> list = campingDAO.selectOneByImg(maxCampingIdx);
		for (CampingDTO img : list) {
			if (img.getFirst_img() != null) {
				fileComponent.deleteFile(img.getFirst_img());
			} else {
				String inner = img.getInner_img();
				fileComponent.deleteFile2(inner);
			}
		}
		return campingDAO.deleteCampingImg(maxCampingIdx);
	}

	public int deleteCampingActivity(int maxCampingIdx) {
		return campingDAO.deleteCampingActivity(maxCampingIdx);
	}

	public int deleteCampingPlace(int maxCampingIdx) {
		return campingDAO.deleteCampingPlace(maxCampingIdx);
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

	public List<CampingDTO> selectOneByImg(int maxCampingIdx) {
		return campingDAO.selectOneByImg(maxCampingIdx);
	}

	public CampingDTO selectInnerImg(int camping_idx) {
		return campingDAO.selectInnerImg(camping_idx);
	}

	// 캠핑장명만 가져오기
	public List<CampingDTO> selectFacltnmList() {
		return campingDAO.selectFacltnmList();
	}

	public List<CampingDTO> campingSortViewCount() {
		return campingDAO.campingSortViewCount();
	}

	public void updateConfirm(int camping_idx) {
		campingDAO.updateConfirm(camping_idx);
	}
}
