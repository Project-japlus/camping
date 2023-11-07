package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.ReserveDTO;
import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;

@Service
public class UserService {

	@Autowired
	private HashComponent hashComponent;
	@Autowired
	private UserDAO userDAO;

	// 일반 사용자 회원가입
	public int join_user(UserDTO dto) {
		String salt = hashComponent.getRandomSalt();
		String hash = hashComponent.getHash(dto.getUserpw(), salt);
		dto.setUserpw(hash);
		dto.setSalt(salt);
		dto.setRole("user");
		return userDAO.user_join(dto);
	}

	// 사업자 회원가입
	public int join_bizr(UserDTO dto) {
		String salt = hashComponent.getRandomSalt();
		String hash = hashComponent.getHash(dto.getUserpw(), salt);
		dto.setUserpw(hash);
		dto.setSalt(salt);
		return userDAO.bizr_join(dto);
	}

	// 일반 로그인
	public UserDTO user_login(UserDTO dto) {
		UserDTO login = userDAO.user_selectOneByUserid_login(dto.getUserid());
		if (login != null) {
			String dbpw = login.getUserpw();
			String userpw = hashComponent.getHash(dto.getUserpw(), login.getSalt());
			if (dbpw.equals(userpw)) {
				return login;
			}
		}
		return null;
	}

	// 사업자_로그인
	public UserDTO bizr_login(UserDTO dto) {
		UserDTO login = userDAO.bizr_selectOneBybizrid_login(dto.getUserid());
		if (login != null) {
			String dbpw = login.getUserpw();
			String userpw = hashComponent.getHash(dto.getUserpw(), login.getSalt());
			if (dbpw.equals(userpw)) {
				return login;
			}
		}
		return null;
	}

	public String getHash(String userpw, String salt) {
		return hashComponent.getHash(userpw, salt);
	}

	public int user_modify_pw(UserDTO dto) {
		// hashComponent 에서 랜덤 솔트 받아서 해쉬에 받은 비번 이랑 솔트 메서드 돌리고 해쉬에 넣는다
		String salt = hashComponent.getRandomSalt();
		String hash = hashComponent.getHash(dto.getUserpw(), salt);

		// dto에 해쉬랑 솔트 넣기
		dto.setUserpw(hash);
		dto.setSalt(salt);
		return userDAO.user_modify_pw(dto);
	}

	public int bizr_modify_pw(UserDTO dto) {
		// hashComponent 에서 랜덤 솔트 받아서 해쉬에 받은 비번 이랑 솔트 메서드 돌리고 해쉬에 넣는다
		String salt = hashComponent.getRandomSalt();
		String hash = hashComponent.getHash(dto.getUserpw(), salt);

		// dto에 해쉬랑 솔트 넣기
		dto.setUserpw(hash);
		dto.setSalt(salt);
		return userDAO.bizr_modify_pw(dto);
	}

	public void user_modify_email(UserDTO dto) {
		userDAO.user_modify_email(dto);
	}

	public void bizr_modify_email(UserDTO dto) {
		userDAO.bizr_modify_email(dto);
	}

	public List<Integer> getBookMark(int i) {
		return userDAO.getBookMark(i);
	}

	// 예약된 캠핑장 리스트
	public List<ReserveDTO> reserveAll(int user_idx) {
		return userDAO.reserveAll(user_idx);
	}

//	// 북마크 캠핑장 리스트
//	public List<ReserveDTO> bookmarkAll(int user_idx) {
//		return userDAO.getBookMark(user_idx);
//	}
	
}
