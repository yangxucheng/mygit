package com.oracle.ebp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.TicketDetail2Mapper;
import com.oracle.ebp.domain.TicketDetail2;
@Service
@Scope
public class TicketDetailService2 {
	@Resource
	TicketDetail2Mapper tdm;
	
	public List<TicketDetail2> retrieveAll(){
		return tdm.retrieveAll();
	}
	public void addDetail(TicketDetail2 ticketdetail){
		tdm.addDetail(ticketdetail);
	}
	public TicketDetail2 retrieveByTicketid(int ticketid){
		return tdm.retrieveByTicketid(ticketid);
	}
	public void Update(TicketDetail2 ticketdetail){
		tdm.Update(ticketdetail);
	}
	public void Delete(int tId){
		tdm.Delete(tId);
	}
}
