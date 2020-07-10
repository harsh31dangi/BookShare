package com.bookshare.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshare.model.BookVO;
import com.bookshare.model.CartVO;
import com.bookshare.model.OrderVO;
import com.bookshare.model.WishlistVO;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	SessionFactory sf;
	
	@Override
	public void addBook(BookVO bookVO) {
		try {
			Session s = sf.getCurrentSession();
			s.saveOrUpdate(bookVO);
		}
		catch(Exception e)
		{
			e.printStackTrace();  
		}
	}

	@Override
	public List getSubjects(String sem, String branchCode) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from SubjectVO where Semester='"+sem+"' and BranchId='"+branchCode+"' ");
			ls=q.list();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	@Override
	public List getBooks(long userId)
	{
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from BookVO where status=true and userVO.userId not in ('"+userId+"')");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	@Override
	public List getBookDetails(int id) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from BookVO where bookId = '"+id+"' ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public List getBookByUserId(long id) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from BookVO where userVO.userId = '"+id+"'");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public void addToWishList(WishlistVO wishlist) {
		try {
			Session s=sf.getCurrentSession();
			s.saveOrUpdate(wishlist);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List getBooksFromWishlist(long userId) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from WishlistVO  where userVO.userId = '"+userId+"' and bookVO.status=true ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public List checkInWishlist(int bookId, long userId) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from WishlistVO where userVO.userId = '"+ userId+"' and bookVO.bookId = '"+bookId+"' and bookVO.status=true ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public List findBooksBySubjectCode(long subjectCode) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from BookVO where subjectVO.subjectCode='"+subjectCode+"' and status=true ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public boolean removeFromWishlist(WishlistVO wish) {
		try {
			Session s=sf.getCurrentSession();
			s.delete(wish);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public boolean buyNow(CartVO order) {
		try {
			Session s=sf.getCurrentSession();
			s.saveOrUpdate(order);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public List findBooksFromCart(long userId, int bookId) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from CartVO where userVO.userId = '"+userId+"' and bookVO.bookId='"+bookId+"' and bookVO.status=true ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	@Override
	public List findBooksFromCartByUserID(long userId) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from CartVO where userVO.userId = '"+userId+"' and bookVO.status=true ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public void deleteFromCart(CartVO cart) {
		try {
			Session s=sf.getCurrentSession();
			s.delete(cart);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addToOrders(OrderVO order) {
		try {
			Session s=sf.getCurrentSession();
			s.saveOrUpdate(order);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List getBookFromOrders(int bookId) {
		List ls=new ArrayList();
		try {
			Session s=sf.getCurrentSession();
			Query q=s.createQuery("from OrderVO where bookVO.bookId = '"+bookId+"' ");
			ls=q.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	
	
}
