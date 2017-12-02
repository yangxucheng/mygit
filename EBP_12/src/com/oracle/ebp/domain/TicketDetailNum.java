package com.oracle.ebp.domain;

public class TicketDetailNum {
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	@Override
	public String toString() {
		return "TicketDetailNum [descs=" + descs + ", images=" + images + ", sequence=" + sequence + "]";
	}
	private String descs ;             	
	private String images; 		
	private String sequence;
	public TicketDetailNum() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TicketDetailNum(String descs, String images, String sequence) {
		super();
		this.descs = descs;
		this.images = images;
		this.sequence = sequence;
	}	
	
}
