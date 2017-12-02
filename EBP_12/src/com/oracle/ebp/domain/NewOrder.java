package com.oracle.ebp.domain;

import java.sql.Date;

public class NewOrder {
	

	private int oid;
	private Date commitTime;
	private double amount;
	private User user;
	private NewOrderList orderlist;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public Date getCommitTime() {
		return commitTime;
	}
	public void setCommitTime(Date commitTime) {
		this.commitTime = commitTime;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public NewOrderList getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(NewOrderList orderlist) {
		this.orderlist = orderlist;
	}
	@Override
	public String toString() {
		return "NewOrder [oid=" + oid + ", commitTime=" + commitTime + ", amount=" + amount + ", user=" + user
				+ ", orderlist=" + orderlist + "]";
	}
	public NewOrder(int oid, Date commitTime, double amount, User user, NewOrderList orderlist) {
		super();
		this.oid = oid;
		this.commitTime = commitTime;
		this.amount = amount;
		this.user = user;
		this.orderlist = orderlist;
	}
	public NewOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
