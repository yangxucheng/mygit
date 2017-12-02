package com.oracle.ebp.service;

import java.sql.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.oracle.ebp.dao.OrderMapper;
import com.oracle.ebp.domain.NewOrder;
import com.oracle.ebp.domain.PageBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.OrderException;
@Service
@Scope
public class OrderService {
@Resource
OrderMapper orderMapper;
	public List<NewOrder> selectOrderById(User user) throws OrderException{
		return orderMapper.listOrder(user);
	}
	public void deleteOrder(int oid){
		orderMapper.deleteOrder(oid);
	}
	public NewOrder showDetails(int oid,int uid){
		return orderMapper.orderDtails(oid, uid);
	}
	
	public void deleteOrderlist(int oid){
		orderMapper.deleteOrderlist(oid);
	}
	
	public List<NewOrder> retrieveAllOrder(){
		return orderMapper.retrieveallorder();
	}
	
	public List<NewOrder> selectorderByInput(int number,String username,String idCard){
//		System.out.println("service的oid"+oid);
		return orderMapper.selectOrderByinput(number,username, idCard);
	}
	
	public List<NewOrder> queryOrdersByDatePage(String begin,String end){
		return orderMapper.queryOrdersByDatePage(begin, end);
	}
	
	public PageBean<NewOrder> getOrderPaging(int currentPage,int pageSize,int recordCount,int uid){
		try{
			int start=currentPage==1?0:(currentPage-1)*pageSize;
				recordCount = orderMapper.getCount(uid);
			List<NewOrder> list = orderMapper.getOrder(start, pageSize, uid);
			PageBean<NewOrder> pagebean = new PageBean<NewOrder>(currentPage, pageSize, list, recordCount);
			return pagebean;
		}catch(Exception e){
			System.out.println(e.toString());
			return null;
			
		}
		
		
	}
	
}
