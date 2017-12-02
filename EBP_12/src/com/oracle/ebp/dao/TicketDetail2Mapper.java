package com.oracle.ebp.dao;

import java.util.List;
import com.oracle.ebp.domain.TicketDetail2;

public interface TicketDetail2Mapper {
	public List<TicketDetail2> retrieveAll();
	public void addDetail(TicketDetail2 ticketdetail);
	public TicketDetail2 retrieveByTicketid(int ticketid);
	public void Update(TicketDetail2 ticketdetail);
	public void Delete(int tId);
}
