package com.bookshare.service;

import java.util.List;

import com.bookshare.model.UserVO;

public interface UserService {

	List validate(String email);
	
	void addUser(UserVO userVO);
	
	List getUserById(long id);
	
}
