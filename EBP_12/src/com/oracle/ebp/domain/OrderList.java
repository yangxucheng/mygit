package com.oracle.ebp.domain;

public class OrderList {
    private int lid;
    private String descs;
    private double price;
    private int quantity;
    private double amount;
    private int oid;
    private int tid;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	@Override
	public String toString() {
		return "OrderList [lid=" + lid + ", descs=" + descs + ", price=" + price + ", quantity=" + quantity
				+ ", amount=" + amount + ", oid=" + oid + ", tid=" + tid + "]";
	}
	public OrderList(int lid, String descs, double price, int quantity, double amount, int oid, int tid) {
		super();
		this.lid = lid;
		this.descs = descs;
		this.price = price;
		this.quantity = quantity;
		this.amount = amount;
		this.oid = oid;
		this.tid = tid;
	}
	public OrderList() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}
