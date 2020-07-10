package com.bookshare.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshare.dao.UserDAO;
import com.bookshare.model.UserVO;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List validate(String email)
	{
		return this.userDAO.validate(email);
	}
	
	@Override
	public void addUser(UserVO userVO)
	{
		this.userDAO.addUser(userVO);
	}

	@Override
	public List getUserById(long id) {
		return this.userDAO.getUserById(id);
	}
	
	

}
