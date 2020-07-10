package com.bookshare.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class UserVO {

	@Id
	@Column(name = "userID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long userId;
	
	@Column(name = "userName")
	private String userName;
	
	@Column(name = "ContactNumber")
	private long contactNumber;
	
	@Column(name = "Email")
	private String email;
	
	@Column(name = "Password")
	private String password;
	
	@Column(name = "College")
	private String college;
	
	@Column(name="Gender")
	private String gender;

	@Column(name = "Usertype")
	private String userType;
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}
	
}
