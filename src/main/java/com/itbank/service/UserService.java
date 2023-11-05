package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;

@Service
public class UserService {
	
	@Autowired private HashComponent hashComponent;
	@Autowired private UserDAO userDAO;

	public int join_user(UserDTO dto) {
		String salt = hashComponent.getRandomSalt();
		String hash = hashComponent.getHash(dto.getUserpw(), salt);
		dto.setUserpw(hash);
		dto.setSalt(salt);
		dto.setRole("user");
		return userDAO.user_join(dto);
	}

	public int join_bizr(UserDTO dto) {
		String salt = hashComponent.getRandomSalt();
		String hash = hashComponent.getHash(dto.getUserpw(), salt);
		dto.setUserpw(hash);
		dto.setSalt(salt);
		dto.setRole("bizr");
		return userDAO.bizr_join(dto);
	}

	//일반 로그인
	public UserDTO user_login(UserDTO dto) {
		UserDTO login = userDAO.user_selectOneByUserid_login(dto.getUserid());
		if(login != null) {
			String dbpw = login.getUserpw();
			String userpw = hashComponent.getHash(dto.getUserpw(), login.getSalt());
			if(dbpw.equals(userpw)) {
				return login;
			}
		}
		return null;
	}
	
	//사업자_로그인
	public UserDTO bizr_login(UserDTO dto) {
		UserDTO login = userDAO.bizr_selectOneBybizrid_login(dto.getUserid());
		if(login != null) {
			String dbpw = login.getUserpw();
			String userpw = hashComponent.getHash(dto.getUserpw(), login.getSalt());
			if(dbpw.equals(userpw)) {
				return login;
			}
		}
		return null;
	}

	public String getHash(String userpw, String salt) {
		return hashComponent.getHash(userpw, salt);
	}
	

}
