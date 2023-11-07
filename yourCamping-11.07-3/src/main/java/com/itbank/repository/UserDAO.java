package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
	@Select("select * from user_table where userid=#{userid} and joinconfirm != 'N'")
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
	
	// 사업자 번호 확인
	@Select("select * from bizrNo where bizrNo = #{bizrNo}")
	String getbizrNo(String bizrNo);
	
	// 북마크에서 가져오기
	List<Integer> getBookMark(int i);
	
	// 북마크 추가
	@Insert("insert into bookmark values (#{user_idx}, #{camping_idx})")
	void addBookMark(HashMap<String, Integer> param);

	// 북마크 제거
	@Delete("delete bookmark where user_idx = #{user_idx} and camping_idx = #{camping_idx}")
	void removeBookMark(HashMap<String, Integer> param);
	
}
