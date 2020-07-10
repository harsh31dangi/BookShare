package com.bookshare.model;

import java.util.Date;

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
@Table(name = "Orders")
public class OrderVO {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "order_generator")
	@SequenceGenerator(name = "order_generator",allocationSize = 1,initialValue = 300000,sequenceName = "order_sequence")
	private int orderId;
	
	@Column(name = "date",nullable = false)
	private Date date=new Date();
	
	@Column(name = "paymentMode",nullable = false, length = 20)
	private String paymentMode = "Cash";
	
	@Column(name = "Delivered")
	private boolean delivered=false;

	@ManyToOne
	@JoinColumn(name = "BookId",nullable = false)
	private BookVO bookVO;
	
	@ManyToOne
	@JoinColumn(name = "buyerId")
	private UserVO buyer;
	
	@ManyToOne
	@JoinColumn(name = "sellerId")
	private UserVO seller;           //we'll get this from bookVO
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public BookVO getBookVO() {
		return bookVO;
	}

	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}

	public UserVO getBuyer() {
		return buyer;
	}

	public void setBuyer(UserVO buyer) {
		this.buyer = buyer;
	}

	public UserVO getSeller() {
		return seller;
	}

	public void setSeller(UserVO seller) {
		this.seller = seller;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	
	public boolean isDelivered() {
		return delivered;
	}

	public void setDelivered(boolean delivered) {
		this.delivered = delivered;
	}

	
}
