package com.bookshare.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Subject")
public class SubjectVO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "SubjectId")
	private long id;
	
	@Column(name = "SubjectName")
	private String subjectName;
	
	@Column(name = "SubjectCode")
	private long subjectCode;
	
	@Column(name = "Semester")
	private int semester;
	
	@ManyToOne
	@JoinColumn(name = "BranchId")
	private BranchVO branchVO;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public long getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(long subjectCode) {
		this.subjectCode = subjectCode;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public BranchVO getBranchVO() {
		return branchVO;
	}

	public void setBranchVO(BranchVO branchVO) {
		this.branchVO = branchVO;
	}
	
	

}