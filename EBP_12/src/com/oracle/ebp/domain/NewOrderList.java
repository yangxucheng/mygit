package com.oracle.ebp.domain;

public class NewOrderList {
	private int lid;
	private int tId;
	private String descs;
	private double price;
	private int quantity;//购买张数
	private double amount;//总金额
	private int oid;//订单号
	private NewOrder order;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
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
	public NewOrder getOrder() {
		return order;
	}
	public void setOrder(NewOrder order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "NewOrderList [lid=" + lid + ", tId=" + tId + ", descs=" + descs + ", price=" + price + ", quantity="
				+ quantity + ", amount=" + amount + ", oid=" + oid + ", order=" + order + "]";
	}
	public NewOrderList(int lid, int tId, String descs, double price, int quantity, double amount, int oid,
			NewOrder order) {
		super();
		this.lid = lid;
		this.tId = tId;
		this.descs = descs;
		this.price = price;
		this.quantity = quantity;
		this.amount = amount;
		this.oid = oid;
		this.order = order;
	}
	public NewOrderList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
