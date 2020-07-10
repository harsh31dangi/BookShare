package com.bookshare.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshare.dao.BookDAO;
import com.bookshare.model.BookVO;
import com.bookshare.model.CartVO;
import com.bookshare.model.OrderVO;
import com.bookshare.model.WishlistVO;

@Service
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired BookDAO bookDAO;
	
	@Override
	public void addBook(BookVO bookVO) {
		this.bookDAO.addBook(bookVO);
	}

	@Override
	public List getSubjects(String sem, String branchCode) {
		return this.bookDAO.getSubjects(sem, branchCode);
	}

	@Override
	public List getBooks(long userId) {
		return bookDAO.getBooks(userId);
	}

	@Override
	public List getBookDetails(int id) {
		return this.bookDAO.getBookDetails(id);
	}
	

	@Override
	public List getBookByUserId(long id) {
		return this.bookDAO.getBookByUserId(id);
	}

	@Override
	public void addToWishList(WishlistVO wishlist) {
		this.bookDAO.addToWishList(wishlist);
	}

	@Override
	public List getBooksFromWishlist(long userId) {
		return this.bookDAO.getBooksFromWishlist(userId);
	}

	@Override
	public List checkInWishlist(int bookId, long userId) {
		return this.bookDAO.checkInWishlist(bookId, userId);
	}

	@Override
	public List findBooksBySubjectCode(long subjectCode) {
		return this.bookDAO.findBooksBySubjectCode(subjectCode);
	}

	@Override
	public boolean removeFromWishlist(WishlistVO wish) {
		return this.bookDAO.removeFromWishlist(wish);
	}

	@Override
	public boolean buyNow(CartVO order) {
		return this.bookDAO.buyNow(order);
	}

	@Override
	public List findBooksFromCart(long userId, int bookId) {
		return this.bookDAO.findBooksFromCart(userId, bookId);
	}
	
	@Override
	public List findBooksFromCartByUserID(long userId) {
		return this.bookDAO.findBooksFromCartByUserID(userId);
	}

	@Override
	public void deleteFromCart(CartVO cart) {
		this.bookDAO.deleteFromCart(cart);
	}
	
	@Override
	public void addToOrder(OrderVO order) {
		this.bookDAO.addToOrders(order);
	}

	@Override
	public List getBookFromOrders(int bookId) {
		return this.bookDAO.getBookFromOrders(bookId);
	}
	
	
}

