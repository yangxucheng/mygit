package com.oracle.ebp.service;  

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.TicketMapper;
import com.oracle.ebp.domain.DetailShow;
import com.oracle.ebp.domain.PageBean;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketNum;
 
@Service
@Scope
public class TicketService {
	@Resource
	TicketMapper ticketmapper;
	public List<Ticket> retrieveAll(){
		return ticketmapper.retrieveAll();
	}
	public Ticket retrieveById(int tid){
		return ticketmapper.retrieveById(tid);
	}
	public Ticket retrieveByDescs(String descs){
		return ticketmapper.retrieveByDescs(descs);
	}
	
	
	
	
	
	
	public int getallcount(){
		return ticketmapper.getallcount();
	}
	
	public PageBean<DetailShow> retrieveLike(Integer currentPage, Integer pageSize, Integer recordCount,TicketNum ticket){
		try {
			int start=currentPage==1?0:(currentPage-1)*pageSize;
			
			recordCount=ticketmapper.getcount(ticket);
			      
			List<DetailShow> list=ticketmapper.retrieveLike(start, pageSize, ticket);
			PageBean<DetailShow> pageBean=new PageBean<DetailShow>(currentPage, pageSize, list, recordCount);
			return pageBean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	     
	
	
	
	
	public void update(Ticket ticket){
		ticketmapper.update(ticket);
	}
	public void insert(Ticket ticket){
		ticketmapper.insert(ticket);
	}
	
	
	
	public void delete(int tid){
		ticketmapper.delete(tid);
	}
	public void updatetid(int tid){
		ticketmapper.updatetid(tid);
	}

	public void UpdateStatusZero(int tid){
		ticketmapper.UpdateStatusZero(tid);
	}
	public void UpdateStatusOne(int tid){
		ticketmapper.UpdateStatusOne(tid);
	}
	
	
}
