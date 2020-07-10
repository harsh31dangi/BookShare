package com.bookshare.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshare.model.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sf;
	
	@Override
	public List validate(String email) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from UserVO where email = '"+email+"' ");
			ls=q.list();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ls;
	}
	
	@Override
	public void addUser(UserVO userVO)
	{
		try {
			Session s=sf.getCurrentSession();
			s.saveOrUpdate(userVO);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public List getUserById(long id) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from UserVO where userID = '"+id+"'");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	
	

}
