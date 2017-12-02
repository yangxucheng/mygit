package com.oracle.ebp.domain;

import java.sql.Date;

public class Order {
    private int oid;
    private Date commitTime;
    private double amount;
    private int uid;
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
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", commitTime=" + commitTime + ", amount=" + amount + ", uid=" + uid + "]";
	}
	public Order(int oid, Date commitTime, double amount, int uid) {
		super();
		this.oid = oid;
		this.commitTime = commitTime;
		this.amount = amount;
		this.uid = uid;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}
