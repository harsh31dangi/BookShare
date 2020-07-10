package com.bookshare.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshare.model.BookVO;
import com.bookshare.model.CartVO;
import com.bookshare.model.OrderVO;
import com.bookshare.model.UserVO;
import com.bookshare.model.WishlistVO;
import com.bookshare.service.BookService;
import com.bookshare.service.UserService;

import sun.net.www.URLConnection;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;

	@GetMapping(value = "login")
	public ModelAndView login(){
		return new ModelAndView("Login","LoginData",new UserVO());
	}
	
	@GetMapping(value="signup")
	public ModelAndView signup(){
		return new ModelAndView("Signup","SignupData",new UserVO());
	}
	
	@GetMapping(value = "validateUser")
	public ResponseEntity<Object> validate(@RequestParam String em,@RequestParam String pw ,HttpServletRequest req) {
		List ls=this.userService.validate(em);
		UserVO uvo=(UserVO)ls.get(0);
		
		if(uvo.getEmail().equals(em) && uvo.getPassword().equals(pw) )
		{
			HttpSession h=req.getSession();
			h.setAttribute("UserName",uvo.getEmail());
			h.setAttribute("userID",uvo.getUserId());
			h.setAttribute("Password",uvo.getPassword());
			h.removeAttribute("logoutFlag");
			return new ResponseEntity<Object>("true",HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<Object>("false",HttpStatus.OK);
		}
	}
	
	@GetMapping(value = "verifyOTP")
	public ModelAndView verifyOTP() {
		try {
			// Construct data
			String apiKey = "apikey=" + URLEncoder.encode("Ii6oOy2cVnE-UAWOPjTFeXrHjZRiO6u7Q8kf03pmak", "UTF-8");
			Random ran=new Random();
			int otp=ran.nextInt(999999);
			
			String message = "&message=" + URLEncoder.encode("This is your message from harshil"+ otp, "UTF-8");
			String sender = "&sender=" + URLEncoder.encode("Harshil TXTLCL", "UTF-8");
			String numbers = "&numbers=" + URLEncoder.encode("9106920046", "UTF-8");
			
			// Send data
			String data = "https://api.textlocal.in/send/?" + apiKey + numbers + message + sender;
			URL url = new URL(data);
			java.net.URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			
			// Get the response
			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			String sResult="";
			while ((line = rd.readLine()) != null) {
			// Process line...
				sResult=sResult+line+" ";
			}
			rd.close();
			System.out.println("OTP sent");
			return null;
			//return sResult;
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			return null;
		}

	}
	
	@PostMapping(value = "addUser")
	public ModelAndView addUser(@ModelAttribute UserVO userVO)
	{
		this.userService.addUser(userVO);
		return new ModelAndView("redirect:/login");
	}
	
	@GetMapping(value = "editProfile")
	public ModelAndView editProfile(HttpSession session) {
		UserVO user=new UserVO();
		long userId=(Long)session.getAttribute("userID");
		List ls=this.userService.getUserById(userId);
		user=(UserVO) ls.get(0);
		user.setUserId(userId);
		return new ModelAndView("Signup","SignupData",user);
	}
	
	@GetMapping(value = "home")
	public ModelAndView home(HttpSession session)
	{
		long userId=(Long)session.getAttribute("userID");
		List ls=this.bookService.getBooks(userId);
		return new ModelAndView("Home","BookList",ls);
	}
	
	@GetMapping(value = "sell")
	public ModelAndView sell(HttpSession session) {
		long id=(Long)session.getAttribute("userID");
		List ls=this.bookService.getBookByUserId(id);
		return new ModelAndView("Sell","BookDetailsByUserID",ls);
	}
	
	@GetMapping(value = "cart")
	public ModelAndView cart(HttpSession session) {
		
		long id=(Long)session.getAttribute("userID");
		List ls=this.bookService.findBooksFromCartByUserID(id);
		return new ModelAndView("Cart","BooksInCart",ls);
	}
	
	@GetMapping(value = "wishlist")
	public ModelAndView wishlist(HttpSession session) {
		long userId = (Long)session.getAttribute("userID");
		List ls=this.bookService.getBooksFromWishlist(userId);
		return new ModelAndView("Wishlist","WishlistBooks",ls);
	}
	
	@GetMapping(value = "profile")
	public ModelAndView profile(HttpSession session) {
		long userId = (Long)session.getAttribute("userID");
		List ls=this.userService.getUserById(userId);
		return new ModelAndView("Profile","UserDetails",ls);
	}
	
	@GetMapping(value = "addToCart")
	public ModelAndView buyNow(@RequestParam int bookId,HttpSession session) {
		long userId = (Long)session.getAttribute("userID");
		CartVO order=new CartVO();
		
		List ls=this.bookService.findBooksFromCart(userId, bookId);
		
		if(ls.isEmpty()) {
			BookVO book=new BookVO();
			UserVO user=new UserVO();
			book.setBookId(bookId);
			user.setUserId(userId);
			order.setBookVO(book);
			order.setUserVO(user);
			boolean bool = this.bookService.buyNow(order);
			List ls1=this.bookService.findBooksFromCartByUserID(userId);
			return new ModelAndView("Cart","BooksInCart",ls1);
		}
		else {
			System.out.println("book already present in cart");
			List ls1=this.bookService.findBooksFromCartByUserID(userId);
			return new ModelAndView("Cart","BooksInCart",ls1);
		}
	}
	
	@GetMapping(value = "logout")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("userID");
		session.removeAttribute("UserName");
		session.removeAttribute("Password");
		
		session.setAttribute("logoutFlag","loggedOut");
		return new ModelAndView("Login");
	}
	
	@GetMapping(value = "buyNow")
	public ModelAndView buyBook(@RequestParam int bookId) {
		List ls=this.bookService.getBookDetails(bookId);
		return new ModelAndView("BuyNow","BuyBookDetails",ls);
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "order")
	public ModelAndView order(@RequestParam int bookId,HttpSession session) {
		
		BookVO book=new BookVO();
		UserVO user=new UserVO();
		WishlistVO wish=new WishlistVO();
		OrderVO order=new OrderVO();
		
		List<BookVO> ls=this.bookService.getBookDetails(bookId);
		book=(BookVO)ls.get(0);
		book.setBookId(bookId);
		book.setStatus(false);
		
		long userId=(Long)session.getAttribute("userID");
		user.setUserId(userId);
		
		wish.setBookVO(book);
		wish.setUserId(user);
		this.bookService.removeFromWishlist(wish);
		
		order.setBookVO(book);
		order.setDate(new Date());
		UserVO buyer=new UserVO();
		UserVO seller=new UserVO();
		buyer.setUserId(userId);
		seller.setUserId(book.getUserVO().getUserId());
		order.setBuyer(buyer);
		order.setSeller(seller);
		this.bookService.addToOrder(order);
		
		System.out.println("book delete");
		this.bookService.addBook(book);
		return new ModelAndView("Order");
	}
	
	@GetMapping(value = "checkIfOrdered")                                      //to check if the book is ordered or not from sell page
	public ResponseEntity<Object> checkIfOrdered(@RequestParam int bookId){
		List ls=this.bookService.getBookFromOrders(bookId);
		System.out.println("checkOrdered");
		if(ls.isEmpty())
			return new ResponseEntity<Object>("notOrdered",HttpStatus.OK);
		else {
			OrderVO order=new OrderVO();
			order=(OrderVO)ls.get(0);
			if(order.isDelivered())
				return new ResponseEntity<Object>("delivered",HttpStatus.OK);
			else
				return new ResponseEntity<Object>("notDelivered",HttpStatus.OK);
		}
	}
	
	@GetMapping(value = "markBookAsDelivered")
	public ResponseEntity<Object> markBookAsDelivered(@RequestParam int bookId){
		List ls=this.bookService.getBookFromOrders(bookId);
		OrderVO order=new OrderVO();
		order=(OrderVO)ls.get(0);
		order.setDelivered(true);
		this.bookService.addToOrder(order);
		System.out.println("mark as delivered");
		return new ResponseEntity<Object>("true",HttpStatus.OK);
	}
}

