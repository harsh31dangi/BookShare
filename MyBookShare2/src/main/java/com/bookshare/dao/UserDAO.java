package com.bookshare.dao;

import java.util.List;

import com.bookshare.model.UserVO;

public interface UserDAO {

	List validate(String email);
	
	void addUser(UserVO userVO);
	
	List getUserById(long id);

}
