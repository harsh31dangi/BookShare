package com.bookshare.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Cart")
public class CartVO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long cartId;
	
	@OneToOne
	@JoinColumn(name = "UserID")
	private UserVO userVO;
	
	@ManyToOne
	@JoinColumn(name = "BookId")
	private BookVO bookVO;

	public long getCartId() {
		return cartId;
	}

	public void setCartId(long cartId) {
		this.cartId = cartId;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public BookVO getBookVO() {
		return bookVO;
	}

	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}
	
}
