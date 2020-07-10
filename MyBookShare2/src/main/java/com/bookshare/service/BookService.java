package com.bookshare.service;

import java.util.List;

import com.bookshare.model.BookVO;
import com.bookshare.model.CartVO;
import com.bookshare.model.OrderVO;
import com.bookshare.model.WishlistVO;

public interface BookService {

	void addBook(BookVO bookVO);
	
	List getSubjects(String sem,String branchCode);
	
	List getBooks(long userID);
	
	List getBookDetails(int id);
	
	List getBookByUserId(long id);
	
	void addToWishList(WishlistVO wishlist);
	
	List getBooksFromWishlist(long userId);
	
	List checkInWishlist(int bookId,long userId);
	
	List findBooksBySubjectCode(long subjectCode);
	
	boolean removeFromWishlist(WishlistVO wish);
	
	boolean buyNow(CartVO order);
	
	List findBooksFromCart(long userId,int bookId);
	
	List findBooksFromCartByUserID(long userId);
	
	void deleteFromCart(CartVO cart);
	
	void addToOrder(OrderVO order);
	
	List getBookFromOrders(int bookId);
	
}
