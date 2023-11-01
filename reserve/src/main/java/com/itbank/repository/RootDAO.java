package com.itbank.repository;

import java.util.List;

import com.itbank.model.ReserveDTO;
import com.itbank.model.User_tableDTO;

public interface RootDAO {
	
	//예약리스트
	List<ReserveDTO> selectList();
	
	//예약상세
	ReserveDTO rootSelectOne(int reserve_idx);
	
	//유저관리
	List<User_tableDTO> userList(User_tableDTO userdto);
	
	//예약취소처리
	int reserveDelete(int reserve_idx);
	
	//유저비활성화
	int userDisabled(int user_idx);

}
