package com.oracle.ebp.domain;

public class TicketDetail2 {

	@Override
	public String toString() {
		return "TicketDetail2 [num=" + num + ", ticketid=" + ticketid + ", Images=" + Images + "]";
	}
	public String getImages() {
		return Images;
	}
	public void setImages(String images) {
		Images = images;
	}
	public int getTicketid() {
		return ticketid;
	}
	public void setTicketid(int ticketid) {
		this.ticketid = ticketid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	
	private int num;
	private int ticketid;
	private String Images;
	public TicketDetail2() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
