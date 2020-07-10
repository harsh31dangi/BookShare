package com.bookshare.dao;

import java.util.List;

import com.bookshare.model.BookVO;
import com.bookshare.model.CartVO;
import com.bookshare.model.OrderVO;
import com.bookshare.model.WishlistVO;

public interface BookDAO {

	void addBook(BookVO bookVO);
	
	List getSubjects(String sem,String branchCode);
	
	List getBooks(long userId);
	
	List getBookDetails(int id);
	
	List getBookByUserId(long id);
	
	void addToWishList(WishlistVO wishlist);
	
	List getBooksFromWishlist(long userId);
	
	List checkInWishlist(int bookId,long userId);
	
	boolean removeFromWishlist(WishlistVO wish);
	
	List findBooksBySubjectCode(long subjectCode);
	
	List findBooksFromCart(long userId,int bookId);
	
	List findBooksFromCartByUserID(long userId);
	
	boolean buyNow(CartVO order);
	
	void deleteFromCart(CartVO cart);
	
	void addToOrders(OrderVO order);
	
	List getBookFromOrders(int bookId);
}
