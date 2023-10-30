package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.User_tableDTO;
import com.itbank.repository.ReserveDAO;

@Service
public class ReservService {
	
	@Autowired private ReserveDAO reserveDAO;
	
	public List<CampingDTO> selectList() {
		// TODO Auto-generated method stub
		return reserveDAO.selectList();
	}
	
	public CampingDTO selectOne(int camping_idx) {
		// TODO Auto-generated method stub
		return reserveDAO.selectOne(camping_idx);
	}

	public int reservation(ReserveDTO reservedto) {
//		int camping_idx = reservedto.getCamping_idx();
//		int row = reserveDAO.minusSiteCo(camping_idx);
		
		return reserveDAO.reservation(reservedto);
	}

	public User_tableDTO login(User_tableDTO dto) {
		// TODO Auto-generated method stub
		return reserveDAO.selectOneByUserid(dto.getUserid());
	}

	public ReserveDTO reserveOne(int camping_idx) {
		// TODO Auto-generated method stub
		return reserveDAO.reserveOne(camping_idx);
	}



	
}
