package com.bookshare.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.ReverbType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookshare.compare.CompareByDiscount;
import com.bookshare.compare.CompareByPopularity;
import com.bookshare.compare.CompareByPrice;
import com.bookshare.model.BookVO;
import com.bookshare.model.CartVO;
import com.bookshare.model.UserVO;
import com.bookshare.model.WishlistVO;
import com.bookshare.service.BookService;

@Controller
public class BookController {

	@Autowired 
	BookService bookService;

	@GetMapping(value="/")
	public ModelAndView go()
	{
		return new ModelAndView("Index");
	}
	
	@GetMapping(value = "sort")
	public ModelAndView sort() {
		return new ModelAndView("Sort");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "sortList")
	public ModelAndView sortListBySubject( HttpServletRequest req ) {
		String sc=req.getParameter("subjectCode");
		long subjectCode = Long.parseLong(sc);
		
		List<BookVO> ls=this.bookService.findBooksBySubjectCode(subjectCode);
		return new ModelAndView("Home","BookList",ls);
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "getSubjects")
	@ResponseBody
	public ResponseEntity<Object> getSubjects(@RequestParam String sem,@RequestParam String bran) {
		List<BookVO> ls=this.bookService.getSubjects(sem, bran);
		System.out.println(ls);
		return new ResponseEntity<Object>(ls,HttpStatus.OK);
	}
	
	@GetMapping(value = "addBook")
	public ModelAndView addBook() {
		return new ModelAndView("AddBook","Book",new BookVO());
	}
	
	@PostMapping(value = "insertBook")
	public ModelAndView insertBook(@ModelAttribute BookVO bookVO,@RequestParam MultipartFile front,@RequestParam MultipartFile back,HttpSession s) {
		try {
			int originalPrice = bookVO.getOriginalPrice();
			int sellingPrice = bookVO.getSellingPrice();
			int discount =  ( (originalPrice - sellingPrice) * 100 ) / originalPrice;
			bookVO.setDiscount(discount);
			
			   String path=s.getServletContext().getRealPath("/");
			   path = path + "resources/docs/";
			   
			   String fileFront = front.getOriginalFilename();
			   String fileBack = back.getOriginalFilename();
			   
			   	byte[] f = front.getBytes();
			   	byte[] b = back.getBytes();
				
			   	FileOutputStream frontFos = new FileOutputStream(path + fileFront);
				BufferedOutputStream frontBos = new BufferedOutputStream(frontFos);
				
				FileOutputStream backFos = new FileOutputStream(path + fileBack);
				BufferedOutputStream backBos = new BufferedOutputStream(backFos);
				
				frontBos.write(f);
				backBos.write(b);
				bookVO.setFrontImageStatus(true);
				bookVO.setBackImageStatus(true);
				bookVO.setFrontImage(fileFront);
				bookVO.setBackImage(fileBack);
				
				this.bookService.addBook(bookVO);

			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/home");
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "bookDetailsFromHome")
	public ModelAndView bookDetailsFromHome(@RequestParam int id) {
		List<BookVO> ls=this.bookService.getBookDetails(id);
		BookVO book = (BookVO) ls.get(0);
		int view = book.getViews();
		view=view +1;
		book.setViews(view);
		book.setBookId(id);
		this.bookService.addBook(book);
		return new ModelAndView("BookDetails","bookDetail",ls);
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "bookDetails")
	public ModelAndView bookDetails(@RequestParam int id) {
		List<BookVO> ls=this.bookService.getBookDetails(id);
		return new ModelAndView("BookDetails","bookDetail",ls);
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "addToWishList")
	public ResponseEntity<Object> addToWishlist(@RequestParam int bookID,HttpSession session) {
		WishlistVO wishlist=new WishlistVO();
		
		long userId=(Long)session.getAttribute("userID");
		System.out.println("Harshil");
		
		List<BookVO> ls=this.bookService.checkInWishlist(bookID, userId);
		
		if(ls.isEmpty()) {
			BookVO book=new BookVO();
			book.setBookId(bookID);
			UserVO user=new UserVO();
			user.setUserId(userId);
		
			wishlist.setBookVO(book);
			wishlist.setUserId(user);
			
			this.bookService.addToWishList(wishlist);
			return new ResponseEntity<Object>("true",HttpStatus.OK);
		}
		else {
			System.out.println("Book already present in wishlist");
			return new ResponseEntity<Object>("false",HttpStatus.OK);
		}
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "checkInWishList")
	public ResponseEntity<Object> checkInWishlist(@RequestParam int bookID,HttpSession session) {
		
		long userId=(Long)session.getAttribute("userID");
		List<WishlistVO> ls=this.bookService.checkInWishlist(bookID, userId);
		
		if(ls.isEmpty()) {
			return new ResponseEntity<Object>("true",HttpStatus.OK);
		}
		else {
			System.out.println("Book already present in wishlist");
			return new ResponseEntity<Object>("false",HttpStatus.OK);
		}
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "removeFromWishList")
	public ResponseEntity<Object> removeFromWishList(@RequestParam int bookID,HttpSession session) {
		
		WishlistVO wish=new WishlistVO();
		List<WishlistVO> ls=this.bookService.checkInWishlist(bookID , (Long)session.getAttribute("userID"));
		wish = (WishlistVO) ls.get(0);
		
		boolean flag=this.bookService.removeFromWishlist(wish);
		if(flag==true) {
			return new ResponseEntity<Object>("true",HttpStatus.OK);
		}
		else {
			return new ResponseEntity<Object>("flase",HttpStatus.OK);
		}
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "filter")
	public ModelAndView filterBook(HttpServletRequest req,HttpSession session) {
		
		long userID=(Long)session.getAttribute("userID");
		String flag=req.getParameter("flag");
		List<BookVO> ls=this.bookService.getBooks(userID);
		
		if(flag.equals("priceHL"))
			Collections.sort(ls, new CompareByPrice().reversed());
		else if(flag.equals("priceLH"))
			Collections.sort(ls,new CompareByPrice());
		else if(flag.equals("discount"))
			Collections.sort(ls,new CompareByDiscount().reversed());
		else
			Collections.sort(ls,new CompareByPopularity().reversed());
		
		return new ModelAndView("Home","BookList",ls);
	}
	
	@GetMapping(value = "deleteFromCart")
	public ModelAndView deleteFromCart(@RequestParam int bookId,HttpSession session) {
		long userId=(Long)session.getAttribute("userID");
		CartVO cart=new CartVO();
		BookVO book=new BookVO();
		UserVO user=new UserVO();
		
		user.setUserId(userId);
		book.setBookId(bookId);
		List ls=this.bookService.findBooksFromCart(userId, bookId);
		cart=(CartVO)ls.get(0);
		this.bookService.deleteFromCart(cart);
		List ls1=this.bookService.findBooksFromCartByUserID(userId);
		
		return new ModelAndView("Cart","BooksInCart",ls1);
		
	}
	
	@GetMapping(value = "deleteBookFromSell")
	public ResponseEntity<Object> deleteBookFromSell(@RequestParam int bookId){
		List<BookVO> ls=this.bookService.getBookDetails(bookId);
		BookVO book = (BookVO) ls.get(0);
		book.setBookId(bookId);
		book.setStatus(false);
		this.bookService.addBook(book);
		return new ResponseEntity<Object>("true",HttpStatus.OK);
	}
}
