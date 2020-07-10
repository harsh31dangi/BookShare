package com.bookshare.model;

import java.util.Comparator;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Book")
public class BookVO implements Comparator<BookVO> {

	@Id
	@Column(name = "BookId")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "book_Generator")
	@SequenceGenerator(name = "book_Generator",initialValue = 200000, allocationSize = 1,sequenceName = "book_Sequence")
	private long bookId;
		
	@Column(name = "BookName",nullable = false,length = 40)
	private String bookName;
		
	@Column(name = "AuthorName",nullable = false,length = 20)
	private String authorName;
		
	@Column(name = "Edition",nullable = false)
	private int edition;
		
	@Column(name = "Publication",nullable = false,length = 20)
	private String publication;
		
	@Column(name = "totalPages",nullable = false)
	private int totalPages;
		
	@Column(name = "BookCondition",nullable = false)
	private String bookCondition;
	
	@Column(name = "SellingPrice",nullable = false)
	private int sellingPrice;
	
	@Column(name = "OriginalPrice",nullable = false)
	private int originalPrice;
	
	@Column(name = "discount")
	private int discount= 0;
		
	@Column(name = "Status")
	private boolean status=true;
		
	@Column(name = "Views")
	private int views=0;
		
	@Column(name = "frontImage",nullable = false,length = 200)
	private String frontImage;
		
	@Column(name = "backImage",nullable = false,length = 200)
	private String backImage;
		
	@Column(name = "frontImageStatus",nullable = false)
	private boolean frontImageStatus=false;
		
	@Column(name = "backImageStatus",nullable = false)
	private boolean backImageStatus=false;
	
	//seller
	@ManyToOne
	@JoinColumn(name = "UserId")
	private UserVO userVO;
		
	@ManyToOne
	@JoinColumn(name="SubjectId")
	private SubjectVO subjectVO;
	
	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public int getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(int originalPrice) {
		this.originalPrice = originalPrice;
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public String getBookCondition() {
		return bookCondition;
	}

	public void setBookCondition(String bookCondition) {
		this.bookCondition = bookCondition;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getFrontImage() {
		return frontImage;
	}

	public void setFrontImage(String frontImage) {
		this.frontImage = frontImage;
	}

	public String getBackImage() {
		return backImage;
	}

	public void setBackImage(String backImage) {
		this.backImage = backImage;
	}

	public boolean isFrontImageStatus() {
		return frontImageStatus;
	}

	public void setFrontImageStatus(boolean frontImageStatus) {
		this.frontImageStatus = frontImageStatus;
	}

	public boolean isBackImageStatus() {
		return backImageStatus;
	}

	public void setBackImageStatus(boolean backImageStatus) {
		this.backImageStatus = backImageStatus;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public SubjectVO getSubjectVO() {
		return subjectVO;
	}

	public void setSubjectVO(SubjectVO subjectVO) {
		this.subjectVO = subjectVO;
	}
	
	@Override
	public int compare(BookVO book1,BookVO book2) {
		if(book1.getSellingPrice() > book2.getSellingPrice()) 
			return 1;
		else if(book1.getSellingPrice() > book2.getSellingPrice())
			return -1;
		
		return 0;	
	}

}
