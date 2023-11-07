package com.itbank.repository;

import java.util.List;

import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;

public interface RootDAO {
	
	//예약리스트
	List<ReserveDTO> selectList();
	
	//예약상세
	ReserveDTO rootSelectOne(int reserve_idx);
	
	//유저관리
	List<UserDTO> userList(UserDTO userdto);
	
	//예약취소처리
	int reserveDelete(int reserve_idx);
	
	//유저비활성화
	int userDisabled(int user_idx);

	ReserveDTO rootOne(int reserve_idx);

//	int checkOutByRoot(int reserve_idx);
//
//	int resetSiteByRoot(ReserveDTO reservedto);
	

}
