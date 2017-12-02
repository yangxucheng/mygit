package com.oracle.ebp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.AdminMapper;
import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.LoginException;
@Service
@Scope
public class AdminService {
	@Resource
	AdminMapper adminmapper;
	public Admin adminLogin(String username, String password)  throws LoginException {
		
		Admin admin = adminmapper.retrieve(username);
		return admin;
	}
	public List<User> getAllUsers(){
		List<User> userList = new  ArrayList<User>();
		userList = adminmapper.getAllUsers();
		return userList;
	}
	//通过注册时间查用户
	public List<User> getUsersByTime(String begin, String end){
		List<User> userList = new  ArrayList<User>();
		userList = adminmapper.getUsersByTime(begin, end);
		return userList;
	}
	//通过用户名/姓名，身份证，联系方式查询用户
	public List<User> getUsersByNameIdcardTelno(String name, String idCard, String telno){
		List<User> userList = new  ArrayList<User>();
		userList = adminmapper.getUsersByNameIdcardTelno(name, idCard, telno);
		return userList;
	}
	//禁用用户
	public void stopUser(Integer uid){
		adminmapper.stopUser(uid);
	}
	//激活用户
	public void startUser(Integer uid){
		adminmapper.startUser(uid);
	}

}
