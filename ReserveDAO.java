package com.itbank.repository;


import java.util.HashMap;
import java.util.List;

import com.itbank.model.CampingDTO;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;

public interface ReserveDAO {
	List<CampingDTO> selectList();
	
	int reservation(ReserveDTO reservedto);

//	int minusSiteCo(int camping_idx);

	UserDTO selectOneByUserid(String userid);

	ReserveDTO reserveOne(int reserve_idx);

	int paymentByOne(int reserve_idx);

	int minuseSiteCo(ReserveDTO reservedto);
	
	CampingDTO selectOne(int camping_idx);

	int selectA(HashMap<String, Object> param);

	int selectB(HashMap<String, Object> param);

	int selectC(HashMap<String, Object> param);

	int getMaxReserveIdx();

	int totalPrice(HashMap<String, Object> param);


	
}
