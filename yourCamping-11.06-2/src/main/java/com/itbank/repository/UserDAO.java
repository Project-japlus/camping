package com.itbank.repository;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	// 일반 비밀번호 수정
	@Update("update user_table set userpw = #{userpw}, salt = #{salt} where user_idx = #{user_idx}")
	int user_modify_pw(UserDTO dto);

	// 사업자 비밀번호 수정
	@Update("update bizr_table set userpw = #{userpw}, salt = #{salt} where user_idx = #{user_idx}")
	int bizr_modify_pw(UserDTO dto);

	// 일반 이메일 수정
	@Update("update user_table set email= #{email} where user_idx=#{user_idx}")
	int user_modify_email(UserDTO dto);

	// 사업자 이메일 수정
	@Update("update bizr_table set email = #{email} where user_idx=#{user_idx}")
	int bizr_modify_email(UserDTO dto);
	
	// 마이페이지 로그인 체크
	UserDTO checkLogin(UserDTO dto);
	
	// 사업자 번호 확인
	@Select("select * from bizrNo where bizrNo = #{bizrNo}")
	String getbizrNo(String bizrNo);
}