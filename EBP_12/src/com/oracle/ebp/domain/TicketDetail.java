package com.oracle.ebp.domain;

public class TicketDetail {


	@Override
	public String toString() {
		return "TicketDetail [tdid=" + tdid + ", tId=" + tId + ", descs=" + descs + ", images=" + images + ", sequence="
				+ sequence + "]";
	}
	public int getTdid() {
		return tdid;
	}
	public void setTdid(int tdid) {
		this.tdid = tdid;
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
	public TicketDetail(int tdid, int tId, String descs, String images, String sequence) {
		super();
		this.tdid = tdid;
		this.tId = tId;
		this.descs = descs;
		this.images = images;
		this.sequence = sequence;
	}
	public TicketDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int tdid;
	private int tId ;             		// 对应的票的id
	private String descs ;             	// 描述内容，以特定字符分割
	private String images; 		// 描述图片url，以逗号分割
	private String sequence;		// 记录图片和文字描述的顺序
	
}
