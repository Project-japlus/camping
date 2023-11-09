package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;
import com.itbank.repository.RootDAO;

@Service
public class RootService {
	
	@Autowired private RootDAO rootDAO;

	//예약리스트
	public List<ReserveDTO> selectList() {
		return rootDAO.selectList();
	}

	//예약글 상세 
	public ReserveDTO rootSelectOne(int reserve_idx) {
		return rootDAO.rootSelectOne(reserve_idx);
	}

	//유저관리 리스트
	public List<UserDTO> userList(UserDTO userdto) {
		return rootDAO.userList(userdto);
	}

	//예약취소
	public int reserveDelete(int reserve_idx) {
		 return rootDAO.reserveDelete(reserve_idx);
	}

	public int rootDisabled(int user_idx) {
		// TODO Auto-generated method stub
		return rootDAO.userDisabled(user_idx);
	}

	public ReserveDTO rootOne(int reserve_idx) {
		// TODO Auto-generated method stub
		return rootDAO.rootOne(reserve_idx);
	}

	public List<CampingDTO> newCampingList(CampingDTO cdto) {
		// TODO Auto-generated method stub
		return rootDAO.newCampingList(cdto);
	}

	public CampingDTO newListOne(int camping_idx) {
		// TODO Auto-generated method stub
		return rootDAO.newListOne(camping_idx);
	}

	public int newCampingDelete(int camping_idx) {
		// TODO Auto-generated method stub
		return rootDAO.newCampingDelete(camping_idx);
	}

//	public int checkOutByRoot(int reserve_idx) {
//		// TODO Auto-generated method stub
//		return rootDAO.checkOutByRoot(reserve_idx);
//	}
//
//	public int resetSiteByRoot(ReserveDTO reservedto) {
//		// TODO Auto-generated method stub
//		return rootDAO.resetSiteByRoot(reservedto);
//	}
	
}
