package com.oracle.ebp.dao;
import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.ebp.domain.NewOrder;
import com.oracle.ebp.domain.User;
public interface OrderMapper {
	public List<NewOrder> listOrder(User user);
	
	public void deleteOrder(int oid);
	
	public NewOrder orderDtails(int oid,int uid);
	
	public void deleteOrderlist(int oid);
	
	public List<NewOrder> retrieveallorder();
	
	public List<NewOrder> selectOrderByinput(int number,String username,String idCard);
	
	public List<NewOrder> queryOrdersByDatePage(String begin,String end);
	
	public List<NewOrder> getOrder(@Param("start")int start,@Param("length")int length,@Param("uid")int uid);
	public int getCount(int uid);
}
