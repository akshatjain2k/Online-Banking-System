package com.bank.api.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "fd")
@Getter
@Setter
@NoArgsConstructor
public class Fd  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Long accountNo;
	
	private Long fdAccountNo;
	
	private double ammount;
	
	private Long months;
	
	@Temporal(TemporalType.DATE)
	private Date createdDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	public Long getMonths() {
		return months;
	}

	public void setMonths(Long months) {
		this.months = months;
	}

	public Long getFdAccountNo() {
		return fdAccountNo;
	}

	public void setFdAccountNo(Long fdAccountNo) {
		this.fdAccountNo = fdAccountNo;
	}

	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}

	public double getAmmount() {
		return ammount;
	}

	public void setAmmount(double ammount) {
		this.ammount = ammount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
}
