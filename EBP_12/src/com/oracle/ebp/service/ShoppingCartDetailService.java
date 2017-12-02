package com.oracle.ebp.service;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.ShoppingCartDetailMapper;
import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderList;
import com.oracle.ebp.domain.ShoppingCartDetail;
import com.oracle.ebp.domain.ShoppingCartDetailTicket;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.User;

@Service
public class ShoppingCartDetailService {
    @Resource
    ShoppingCartDetailMapper shoppingcartdetailmapper;

    public void insert_shoppingcardetail(ShoppingCartDetail shoppingcartdetail){
  	  shoppingcartdetailmapper.insertByshoppingcartdetail(shoppingcartdetail);
    }
    public void deleteByTid(int tid){
    	shoppingcartdetailmapper.deleteByTid(tid);
    }
    
    public List<ShoppingCartDetail> retrieveAll(){
  	  return shoppingcartdetailmapper.retrieveAll();
    }
    
    public List<ShoppingCartDetailTicket> showShoppingDetailAndTicket(int uid){
    	return shoppingcartdetailmapper.getShoppingDetailAndTicket(uid);
    }
    
    public double get_userbalance(int uid){
    	return shoppingcartdetailmapper.getUserbalance(uid);
    }
    
    public void set_newuserbalance(User user){
    	shoppingcartdetailmapper.setNewBalance(user);
    }
    
    public User get_UserByUid(int uid){
    	return shoppingcartdetailmapper.get_userByUid(uid);
    }
    
    public int insert_order(Order order){
    	return shoppingcartdetailmapper.insert_order(order);
    }
    
    public void insert_orderlist(OrderList orderlist){
    	shoppingcartdetailmapper.insert_orderlist(orderlist);
    }
    
    public void set_newTicketbalance(Ticket ticket){
    	shoppingcartdetailmapper.setNewticketNumbers(ticket);
    }
    
    public List<Order> retrieveorderByUid(int uid){
    	return shoppingcartdetailmapper.retrieveorderByUid(uid);
    }
    
    public List<OrderList> retrieveorderlistByOid(int oid){
    	return shoppingcartdetailmapper.retrieveorderlistByOid(oid);
    }
    
    public int get_Maxoid(){
    	return shoppingcartdetailmapper.get_Maxoid();
    }
    
    public int get_TicketBalance(int tid){
    	return shoppingcartdetailmapper.get_ticketBalance(tid);
    }
    
    public List<Ticket> retrieveAllTicket(){
		return shoppingcartdetailmapper.selectAllTicket();
	}
    
	public ShoppingCartDetail selectShoppingCartbyUid(int uid,int tId){
		return shoppingcartdetailmapper.selectShoppingCartbyTid(uid,tId);
	}
	
	public void updateshoppingTicketnumber(ShoppingCartDetail shoppingcartdetail){
		shoppingcartdetailmapper.updateshoppingTicketnumber(shoppingcartdetail);
	}
   
}
