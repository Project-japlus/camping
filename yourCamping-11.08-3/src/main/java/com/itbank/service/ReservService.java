package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;
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

	public UserDTO login(UserDTO dto) {
		// TODO Auto-generated method stub
		return reserveDAO.selectOneByUserid(dto.getUserid());
	}

	public ReserveDTO reserveOne(int reserve_idx) {
		// TODO Auto-generated method stub
		return reserveDAO.reserveOne(reserve_idx);
	}

	public int paymentByOne(int reserve_idx) {
		// TODO Auto-generated method stub
		return reserveDAO.paymentByOne(reserve_idx);
	}

	public int minuseSiteCo(ReserveDTO reservedto) {
		// TODO Auto-generated method stub
		return reserveDAO.minuseSiteCo(reservedto);
	}

	public int selectA(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return reserveDAO.selectA(param);
	}

	public int selectB(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return reserveDAO.selectB(param);
	}

	public int selectC(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return reserveDAO.selectC(param);
	}

	public int getMaxReserveIdx() {
		return reserveDAO.getMaxReserveIdx();
	}

	public int totalPrice(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return reserveDAO.totalPrice(param);
	}
}
