package com.oracle.ebp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.TicketDetailMapper;
import com.oracle.ebp.domain.PageBean;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;
import com.oracle.ebp.domain.TicketNum;

@Service
@Scope
public class TicketDetailService {
	@Resource
	TicketDetailMapper ticketdetailmapper;
	public TicketDetail retrieveByTid(int tid){
		return ticketdetailmapper.retrieveByTid(tid);
	}
	
	public void addDetail(TicketDetail ticketdetail){
		ticketdetailmapper.addDetail(ticketdetail);
	}
	public void DeleteDetail(int tId){
		ticketdetailmapper.DeleteDetail(tId);
	}
	
	
	public PageBean<TicketDetail> retrieveLike(Integer currentPage, Integer pageSize, Integer recordCount , TicketDetail ticketdetail){
		try {
			int start=currentPage==1?0:(currentPage-1)*pageSize;
			
			recordCount=ticketdetailmapper.getcount(ticketdetail);
			      
			List<TicketDetail> list=ticketdetailmapper.retrieveAll(start, pageSize , ticketdetail);
			PageBean<TicketDetail> pageBean=new PageBean<TicketDetail>(currentPage, pageSize, list, recordCount);
			return pageBean;
		} catch (Exception e) { 
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void update(TicketDetail ticketdetail){
		ticketdetailmapper.update(ticketdetail);
	}
	
}
