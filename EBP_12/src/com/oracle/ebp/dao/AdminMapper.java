package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.User;

public interface AdminMapper {
	public Admin retrieve(String username) ;
	
	public Admin getAdminByuserName(String username);


	public List<User> getAllUsers();

	public List<User> getUsersByTime(String begin, String end);
	public List<User> getUsersByNameIdcardTelno(String name, String idCard, String telno);

	public void stopUser(Integer uid);

	public void startUser(Integer uid);
}
