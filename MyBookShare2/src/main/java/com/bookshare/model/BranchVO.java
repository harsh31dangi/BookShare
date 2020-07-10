package com.bookshare.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Branch")
public class BranchVO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "BranchId")
	private long branchId;
	
	@Column(name = "BranchCode",nullable = false,length = 6)
	private long branchCode;
	
	@Column(name = "BranchName",nullable = false,length = 10)
	private String branchName;
	
	public long getBranchId() {
		return branchId;
	}

	public void setBranchId(long branchId) {
		this.branchId = branchId;
	}

	public long getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(long branchCode) {
		this.branchCode = branchCode;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
}