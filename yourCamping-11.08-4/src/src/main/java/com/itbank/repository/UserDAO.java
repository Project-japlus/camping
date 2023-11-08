package com.itbank.repository;

import org.apache.ibatis.annotations.Select;

import com.itbank.model.UserDTO;

public interface UserDAO {
	
	// 일반_아이디 중복체크
	@Select("select * from user_table where userid=#{userid}")
	UserDTO user_selectOneByUserid_check(String userid);
	
	// 사업자_아이디 중복체크
	@Select("select * from bizr_table where userid=#{userid}")
	UserDTO bizr_selectOneBybizrid_check(String userid);
	
	// 일반_로그인
	@Select("select * from user_table where userid=#{userid}")
	UserDTO user_selectOneByUserid_login(String userid);
	
	// 사업자_로그인
	@Select("select * from bizr_table where userid=#{userid}")
	UserDTO bizr_selectOneBybizrid_login(String userid);
	
	// 일반 사용자 회원가입
	int user_join(UserDTO dto);

	// 사업자 사용자 회원가입
	int bizr_join(UserDTO dto);
	
	
	
	

}
