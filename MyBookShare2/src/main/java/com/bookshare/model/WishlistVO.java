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
@Table(name = "Wishlist")
public class WishlistVO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long wishlistId;
	
	@ManyToOne
	@JoinColumn(name = "UserID")
	private UserVO userVO;
	
	@ManyToOne
	@JoinColumn(name = "BookId")
	private BookVO bookVO;

	public long getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(long wishlistId) {
		this.wishlistId = wishlistId;
	}

	public UserVO getUserId() {
		return userVO;
	}

	public void setUserId(UserVO userId) {
		this.userVO = userId;
	}

	public BookVO getBookVO() {
		return bookVO;
	}

	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}
	
}
