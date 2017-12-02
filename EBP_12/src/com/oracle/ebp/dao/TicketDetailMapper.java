package com.oracle.ebp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.ebp.domain.TicketDetail;

public interface TicketDetailMapper {
	public TicketDetail retrieveByTid(int tid);
	public void addDetail(TicketDetail ticketdetail); 
	
	public void update(TicketDetail ticketdetail);
	  
	
	public void DeleteDetail(int tId);
	public void updatetId(int tId);
	
	
	
	public int getcount(TicketDetail ticketdetail);
	public List<TicketDetail> retrieveAll(@Param("start")int start,@Param("length")int length,@Param("ticketdetail")TicketDetail ticketdetail);
}
