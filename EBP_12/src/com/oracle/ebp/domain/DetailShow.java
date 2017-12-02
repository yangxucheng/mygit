package com.oracle.ebp.domain;

import java.sql.Date;

public class DetailShow {
	@Override
	public String toString() {
		return "DetailShow [tid=" + tid + ", descs=" + descs + ", startTime=" + startTime + ", amount=" + amount
				+ ", balance=" + balance + ", price=" + price + ", status=" + status + ", num=" + num + ", ticketid="
				+ ticketid + ", Images=" + Images + ", Descs2=" + Descs2 + ", images2=" + images2 + ", sequence="
				+ sequence + "]";
	}
	public String getDescs2() {
		return Descs2;
	}
	public void setDescs2(String Descs2) {
		this.Descs2 = Descs2;
	}
	public String getImages2() {
		return images2;
	}
	public void setImages2(String images2) {
		this.images2 = images2;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTicketid() {
		return ticketid;
	}
	public void setTicketid(int ticketid) {
		this.ticketid = ticketid;
	}
	public String getImages() {
		return Images;
	}
	public void setImages(String Images) {
		this.Images = Images;
	}
	private int tid;
	private String descs;
	private Date startTime;  //开始时间
	private int  amount; //总票数
	private int  balance; // 剩余票数
	private double price; //单价
	private int status;//0为已停售状态,1为售票状态
	private int num;
	private int ticketid;
	private String Images;
	private String Descs2 ;             	// 描述内容，以特定字符分割
	private String images2; 		// 描述图片url，以逗号分割
	private String sequence;
	
	public DetailShow(int tid, String descs, Date startTime, int amount, int balance, double price, int status, int num,
			int ticketid, String images, String descs2, String images2, String sequence) {
		super();
		this.tid = tid;
		this.descs = descs;
		this.startTime = startTime;
		this.amount = amount;
		this.balance = balance;
		this.price = price;
		this.status = status;
		this.num = num;
		this.ticketid = ticketid;
		Images = images;
		Descs2 = descs2;
		this.images2 = images2;
		this.sequence = sequence;
	}
	public DetailShow() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
