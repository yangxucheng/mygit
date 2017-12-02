package com.oracle.ebp.dao;

import java.sql.Date;
import java.util.List;

import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderList;
import com.oracle.ebp.domain.ShoppingCart;
import com.oracle.ebp.domain.ShoppingCartDetail;
import com.oracle.ebp.domain.ShoppingCartDetailTicket;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.User;

public interface ShoppingCartDetailMapper {
	public void insertByshoppingcartdetail(ShoppingCartDetail shoppingcartdetail);
	
	public void deleteByTid(int tid);
	
	public List<ShoppingCartDetail> retrieveAll();
	
	public List<ShoppingCartDetailTicket> getShoppingDetailAndTicket(int uid);
	
	public double getUserbalance(int uid);
	
	public void setNewBalance(User user);
	
	public User get_userByUid(int uid);
	
	public int insert_order(Order order);
	
	public void insert_orderlist(OrderList orderlist);
	
	public void setNewticketNumbers(Ticket ticket); 
	
	public List<Order> retrieveorderByUid(int uid);
	
	public List<OrderList> retrieveorderlistByOid(int oid);
	
	public int get_Maxoid();
	
	public int get_ticketBalance(int tid);
	
	public List<Ticket> selectAllTicket();
	
	public ShoppingCartDetail selectShoppingCartbyTid(int uid,int tId);
	
	public void updateshoppingTicketnumber(ShoppingCartDetail shoppingcartdetail);
}
