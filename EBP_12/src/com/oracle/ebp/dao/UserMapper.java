package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.ShoppingCart;
import com.oracle.ebp.domain.User;

public interface UserMapper {
	 public User getUserByUsername(String username);
	 public void updateBalance(User user);
	 
		public List<User> retrieveAll();
	    
	    public User retrieve(String idCard) ;
	    
	    public void insert(User user);
	    
	    public User selectByUsername(String username);
	    
		public  void reviseInfo(User user);//修改个人信息
		
		public void revisePassword(User user);//修改密码
		
		public User retrieveByusername(String username);
		
		public void insertByshoppingcartUid(ShoppingCart shoppingcart);
		
		public int get_Maxuid();
	    
}
