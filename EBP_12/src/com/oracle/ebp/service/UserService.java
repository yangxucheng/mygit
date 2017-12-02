package com.oracle.ebp.service;
import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.UserMapper;
import com.oracle.ebp.domain.ReviseBean;
import com.oracle.ebp.domain.ShoppingCart;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.LoginException;
import com.oracle.ebp.exception.RegisterException;
import com.oracle.ebp.exception.ReviseInfoException;

@Service
@Scope
public class UserService {
	@Resource
	private  UserMapper userMapper;
	
    public  User getUserByUsername(String username) throws LoginException{
	User user=null;
	   try{
	   user = userMapper.getUserByUsername(username);
		}catch(Exception e){
			e.printStackTrace();
			throw new LoginException("登录DAO出现异常"+e.getMessage(),e);
		}
		return user;
	}
    
    public void updateBalance(User user){
    	userMapper.updateBalance(user);
    }
    
public User userRegister(String idCard)  throws RegisterException {
		
		User user = userMapper.retrieve(idCard);
		return user;
	}
	public void Insert(User user){
		userMapper.insert(user);
	}
	
	public void reviseInfo(ReviseBean reb) throws ReviseInfoException{
		try{
			User user = new User(-1,reb.getUsername(),null,reb.getName(),reb.getGender().equals("男")?1:0,reb.getAge(),
					reb.getIdCard(),reb.getAddress(),reb.getTelno(),null,0,1);
			userMapper.reviseInfo(user);
		}catch(Exception e){
			throw new ReviseInfoException("更新失败");
		}
	}
	//查询个人全部信息
	public User selectInfo(String username){
		User user = userMapper.selectByUsername(username);
		return user;
	}
	//修改个人密码
	public void revisePassword(User user){
		userMapper.revisePassword(user);
	}
	
public User userLogin(String username)  throws LoginException {
		
		User user = userMapper.getUserByUsername(username);
		return user;
	}

public void insertShoppingCartUid(ShoppingCart shoppingcart){
	userMapper.insertByshoppingcartUid(shoppingcart);
}

public int get_Maxuid(){
	return userMapper.get_Maxuid();
}
}
