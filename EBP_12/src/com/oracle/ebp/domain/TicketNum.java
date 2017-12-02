package com.oracle.ebp.domain;

import java.sql.Date;

public class TicketNum {
	@Override
	public String toString() {
		return "TicketNum [tid=" + tid + ", descs=" + descs + ", startTime=" + startTime + ", endTime=" + endTime + "]";
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
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	private int tid;
	private String descs; //描述
	private Date startTime;  //开始时间
	private Date endTime;
	public TicketNum(int tid, String descs, Date startTime, Date endTime) {
		super();
		this.tid = tid;
		this.descs = descs;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public TicketNum() {
		super();
		// TODO Auto-generated constructor stub
	}
}
