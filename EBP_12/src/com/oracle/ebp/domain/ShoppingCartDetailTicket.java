package com.oracle.ebp.domain;

import java.sql.Date;

public class ShoppingCartDetailTicket {
	private int scdid;
	private int scid;
	private int tIds;
    private	int quantity;
    private int tid;
    private String descs;
	private Date startTime;
    private int amount;
    private int balance;
    private double price;
    private int status;
	public int getScdid() {
		return scdid;
	}
	public void setScdid(int scdid) {
		this.scdid = scdid;
	}
	public int getScid() {
		return scid;
	}
	public void setScid(int scid) {
		this.scid = scid;
	}
	public int gettIds() {
		return tIds;
	}
	public void settIds(int tIds) {
		this.tIds = tIds;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ShoppingCartDetailTicket [scdid=" + scdid + ", scid=" + scid + ", tId=" + tIds + ", quantity=" + quantity
				+ ", tid=" + tid + ", descs=" + descs + ", startTime=" + startTime + ", amount=" + amount + ", balance="
				+ balance + ", price=" + price + ", status=" + status + "]";
	}
	public ShoppingCartDetailTicket(int scdid, int scid, int tIds, int quantity, int tid2, String descs, Date startTime,
			int amount, int balance, double price, int status) {
		super();
		this.scdid = scdid;
		this.scid = scid;
		this.tIds = tIds;
		this.quantity = quantity;
		tid = tid2;
		this.descs = descs;
		this.startTime = startTime;
		this.amount = amount;
		this.balance = balance;
		this.price = price;
		this.status = status;
	}
	public ShoppingCartDetailTicket() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}
