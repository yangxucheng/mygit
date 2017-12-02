package com.oracle.ebp.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.ebp.domain.DetailShow;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketNum;


public interface TicketMapper {
	
	 public List<Ticket> retrieveAll();
	 public void update(Ticket ticket);
	 public void insert(Ticket ticket);
	 
	 
	 public void delete(int tid) ;
	 public void updatetid(int tid);
	 
	 
	 public Ticket retrieveById(int tid);
	 public Ticket retrieveByDescs(String descs);
	 
	 
	 
	 public void UpdateStatusZero(int tid);
	 public void UpdateStatusOne(int tid);
	 
	 public int getallcount();
	 public int getcount(TicketNum ticket);
	 public List<DetailShow> retrieveLike(@Param("start")int start,@Param("length")int length,@Param("ticketnum")TicketNum ticketnum);
}
