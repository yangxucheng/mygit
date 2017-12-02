package com.oracle.ebp.domain;

import java.sql.Date;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;

public class ShoppingCart {
	@NotNull
	private int scid;
	private Date addTime;
	private int UserId;
	public int getScid() {
		return scid;
	}
	public void setScid(int scid) {
		this.scid = scid;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int UserId) {
		this.UserId = UserId;
	}
	@Override
	public String toString() {
		return "ShoppingCart [scid=" + scid + ", addTime=" + addTime + ", userId=" + UserId + "]";
	}
	public ShoppingCart(int scid, Date addTime, int UserId) {
		super();
		this.scid = scid;
		this.addTime = addTime;
		this.UserId = UserId;
	}
	public ShoppingCart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
