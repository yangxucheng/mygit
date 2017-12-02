package com.oracle.ebp.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import com.oracle.ebp.exception.LoginException;
import com.oracle.ebp.exception.RegisterException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.oracle.ebp.service.UserService;
import com.oracle.ebp.util.constant.Constant;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ebp.domain.OldPassword;
import com.oracle.ebp.domain.ReviseBean;
import com.oracle.ebp.domain.RevisePassword;
import com.oracle.ebp.domain.ShoppingCart;
import com.oracle.ebp.domain.User;

@Controller

public class UserController {
	@Resource
	UserService userSvc;
	public static boolean isNumberic(String str){
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}
	@RequestMapping(value="/revise",method=RequestMethod.POST)
	public String revise(@Valid @ModelAttribute("ReviseBean")ReviseBean reb,Errors errors,HttpSession session){
		//验证表单的基本信息
		//添加User对象
		//返回主页
	    User users = (User) session.getAttribute(Constant.SESSION_USER);
		if(errors.hasFieldErrors())return "user/revise";
		if(reb.getIdCard().length()!=18){
			errors.rejectValue("idCard","empty.ReviseBean.idCard","身份证格式错误");
		}
		if(reb.getTelno().length()!=11||!isNumberic(reb.getTelno())){
			errors.rejectValue("telno","empty.ReviseBean.telno","号码格式错误，不能含有字母、符号");
		}
		if(reb.getAge()<=0||reb.getAge()>150){
			errors.rejectValue("age","empty.ReviseBean.age","年龄错误");
		}
		try{
			reb.setUsername(users.getUsername());
			userSvc.reviseInfo(reb);
			User user = userSvc.selectInfo(users.getUsername());
			session.setAttribute(Constant.SESSION_USER, user);
			return "user/revise";
		}catch(Exception e){
			System.out.println(e.getMessage());
			errors.reject("","修改失败，请等待后重试");
			return "user/revise";
		}

	}
	@RequestMapping("/verifyLogin.action")
	public String verifyLogin(@Valid @ModelAttribute("OldPassword")OldPassword odp,Errors errors,HttpSession session){
		User user= (User) session.getAttribute(Constant.SESSION_USER);
		String op = odp.getOpassword();
		if(errors.hasFieldErrors()) return "user/verifyLogin";
		if(!user.getPassword().equals(op)){
			errors.rejectValue("opassword","empty.RevisePassword.opassword","密码错误");
			return "user/verifyLogin";
		}
		return "user/revisePassword";
	}
	@RequestMapping("/revisePassword.action")
	public String revisePassword(@Valid @ModelAttribute("RevisePassword")RevisePassword rep,Errors errors,HttpSession session){
		User user= (User) session.getAttribute(Constant.SESSION_USER);
		String op = user.getPassword();
		String password = rep.getPassword();
		String spassword = rep.getSpassword();
		if(errors.hasFieldErrors()) return "user/revisePassword";
		if(!password.equals(spassword)){
			errors.rejectValue("spassword","empty.RevisePassword.spassword","两次密码不一致");
			return "user/revisePassword";
		}
		if(op.equals(password)){
			errors.reject("","新密码不能与旧密码相同");
			return "user/revisePassword";
		}
		try{
			user.setPassword(password);
			userSvc.revisePassword(user);
			return "user/reviseSucc";
		}catch(Exception e){
			System.out.println(e.toString());
			return "user/revisePassword";
		}
	}
	
	
	
	
	@RequestMapping("user/register.action")
	public ModelAndView Register(String username, String password, String name, int gender,  String idCard,int age,
			String address, String telno ) {

		ModelAndView mav = new ModelAndView();
		Map<String, String> errors = new HashMap<String, String>();
		if (isHaveNumeric(username)) {
			errors.put("username", "用户名不能含有数字");
		}
		if (password.length()<8) {
			errors.put("password", "密码长度不得小于8位");
			System.out.println( "密码长度不得小于8位");
		}
		if (isNumeric(password)) {
			errors.put("password", "密码不能全为数字");
		}
		if (age < 10 ||age>120) {
			System.out.println("年龄不能小于10岁");
			errors.put("age", "年龄不能小于10岁");
		}
		if (idCard.length()!=18) {
			System.out.println("身份证号位数位为18");
			errors.put("idCard", "身份证号位数位为18");
		}
		if (telno.length()!=11) {
			System.out.println("电话号位数位为11");
			errors.put("telno", "电话号位数位为11");
		}
		if (errors.size() > 0) {
			System.out.println("sadasasdasdd");
			mav.addObject("errors", errors);
			mav.setViewName("user/register");
			return mav;
		}

		User user = null;
		User user2 = null;
		try {
			user2 = userSvc.getUserByUsername(username);
			if (user2.getUsername() != ""&&user2.getUsername() != null ) {
				System.out.println("dsadasdaadsa");
				errors.put("register", "该用户已注册");
				mav.addObject("errors", errors);
				mav.setViewName("user/register");
				return mav;
			}
			User user1 = new User(-1, username, password, name, gender, age, idCard, address, telno,new Date(System.currentTimeMillis()),0,1);
			userSvc.Insert(user1);
			mav.setViewName("user/registerUser");
			return mav;
		} catch (NullPointerException e) {
			try {
				user = userSvc.userRegister(idCard);
				if (user.getIdCard() != ""&&user.getIdCard() != null ) {
					errors.put("register", "该用户已注册");
					mav.addObject("errors", errors);
					mav.setViewName("user/register");
					return mav;
				}
				User user1 = new User(-1, username, password, name, gender, age, idCard, address, telno,new Date(System.currentTimeMillis()),0,1);
				userSvc.Insert(user1);
				mav.setViewName("user/registerUser");
				return mav;
			} catch (RegisterException e1) {		
				errors.put("register", "该用户已注册");
				mav.addObject("errors", errors);
				mav.setViewName("user/register");
				return mav;
			} catch (NullPointerException e1) {
				User user1 = new User(-1, username, password, name, gender, age, idCard, address, telno,new Date(System.currentTimeMillis()),0,1);
				userSvc.Insert(user1);
				mav.setViewName("user/login");
				int maxuid=userSvc.get_Maxuid();
				Date date=new Date(System.currentTimeMillis());
				ShoppingCart sc=new ShoppingCart(-1, date, maxuid);
				userSvc.insertShoppingCartUid(sc);
				return mav;
			}catch(Exception e1){
				errors.put("register", "该用户已注册");
				mav.addObject("errors", errors);
				mav.setViewName("user/register");
				return mav;
			}
		}catch(Exception e){
			errors.put("register", "该用户已注册");
			mav.addObject("errors", errors);
			mav.setViewName("user/register");
			return mav;
		}
		
		
		
		
	}
	public static boolean isNumeric(String str)
	{
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}
	public static boolean isHaveNumeric(String str)
	{
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				return true;
			}
		}
		return false;
	}
	
	
	
	
	@RequestMapping("/Logins.action")
	public ModelAndView Login(String username, String password, HttpSession session,HttpServletRequest req) {
		System.out.println("hello");
		ModelAndView mav = new ModelAndView();
		Map<String, String> errors = new HashMap<String, String>();
		if (username == null || username.equals("")) {
			errors.put("username", "用户名不能为空");
		}
		if (password == null || password.equals("")) {
			errors.put("password", "密码不能为空");
		}

		if (errors.size() > 0) {
			mav.addObject("errors", errors);
			mav.setViewName("user/login");
			return mav;
		}

		User user = null;
		try {
			user = userSvc.userLogin(username);
			if (user.getUsername() == null || user.getUsername().equals("")) {
				throw new LoginException("用户名或密码错误");
			}
			
			if (!user.getPassword().equals(password)) {
				throw new LoginException("用户名或密码错误");
			}
			if(user.getStatus() == 0){
				throw new LoginException("该用户被禁用");
			}
			//session.setAttribute(LoginFilter.ATTR_ADMINUSER, user);
			/*String forwardUrl = (String) session.getAttribute(LoginFilter.ATTR_NEXTURL);
			if (forwardUrl == null)
				forwardUrl = "/"; // when session timeout*/
			session.setAttribute("userInfo", user);
			String nextUrl=(String)session.getAttribute(Constant.ATTR_NEXTURL);
			//如果session已超时，则nextUrl可能为null，如为null，则重定向主页
			mav.setViewName("redirect:"+(nextUrl==null?"/index.jsp":nextUrl));
			System.out.println(nextUrl);
			return mav;
		} catch (LoginException e) {
			errors.put("GLOBAL", e.getMessage());
			mav.addObject("errors", errors);
			mav.setViewName("user/login");
			return mav;
		}catch(NullPointerException e){
			errors.put("GLOBAL", "用户名密码错误");
			mav.addObject("errors", errors);
			mav.setViewName("user/login");
			return mav;
		}

	}
	
	@RequestMapping("/admin/register.action")
	public String goto_register(Model model){
		return "user/register";
	}
	
	@RequestMapping("/layout.action")
	public String logout(HttpSession session){
		//将用户从session中删除
		session.removeAttribute("userInfo");

		return "index";
	}
}
