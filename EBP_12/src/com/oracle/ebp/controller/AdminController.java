package com.oracle.ebp.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.LoginException;

import com.oracle.ebp.service.AdminService;

@Controller
public class AdminController {
	@Resource
	AdminService adminSvc;
	@RequestMapping("/AdminLogin.action")
	public ModelAndView Login(String username, String password, HttpSession session) {
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
			mav.setViewName("admin/adminlogin");
			return mav;
		}

		Admin admin = null;
		try {
			admin = adminSvc.adminLogin(username, password);
			if (admin.getUsername() == null || admin.getUsername().equals("")) {
				throw new LoginException("用户名或密码错误");
			}
			if ( !admin.getPassword().equals(password)) {
				throw new LoginException("用户名或密码错误");
			}
			/*session.setAttribute(LoginFilter.ATTR_ADMINUSER, admin);
			String forwardUrl = (String) session.getAttribute(LoginFilter.ATTR_NEXTURL);
			if (forwardUrl == null)
				forwardUrl = "/"; // when session timeout*/
			mav.setViewName("admin/adminfunction");
			System.out.println("asdasasdsa");
			session.setAttribute("adminInfo", admin);
			return mav;
		} catch (LoginException e) {
			errors.put("GLOBAL", e.getMessage());
			mav.addObject("errors", errors);
			mav.setViewName("admin/adminlogin");
			return mav;
		}catch(NullPointerException e){
			errors.put("GLOBAL", "没有此用户");
			mav.addObject("errors", errors);
			mav.setViewName("admin/adminlogin");
			return mav;
		}

	}
	@RequestMapping(value = "/admin/ShowAllUser.action")
	public String showAllUsers(Model model) {
		List<User> userList = new ArrayList<User>();
		userList = adminSvc.getAllUsers();
		model.addAttribute("userList", userList);
/*		for (User user : userList) {
			System.out.println(user.toString());
		}*/
		return "admin/ShowAllUser";
	}
	
	
	
	
			//禁用、启用用户				
	@RequestMapping(value = "admin/updateUserStatusById.view", method = RequestMethod.POST)
	public void updateUserStatusById(Integer uid, Integer status, HttpServletRequest request, HttpServletResponse res) {
		if (status == 1) {
			adminSvc.startUser(uid);
			//System.out.println("xzxz");
		}
		if (status == 0) {
			adminSvc.stopUser(uid);
			//System.out.println("sss");
		}
		PrintWriter out;
		try {
			out = res.getWriter();
			out.write(status.toString());
			out.flush();
			out.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/GetUserBynuit.view", method = RequestMethod.POST)
	public String GetUserBynuit(String name, String idCard, String telno, Model model) {
		List<User> userList = new ArrayList<User>();
		System.out.println("haha");
		userList = adminSvc.getUsersByNameIdcardTelno(name, idCard, telno);
		model.addAttribute("userList", userList);
		return "admin/ShowAllUser";
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/GetUserByTime.view", method = RequestMethod.POST)
	public String GetUserByTime(String begin, String end, Model model) throws Exception {
		// System.out.println(begin);
		//System.out.println(end);
		List<User> userList = new ArrayList<User>();
		 //System.out.println("11111");
		userList = adminSvc.getUsersByTime(begin, end);
		//System.out.println("222222");
		model.addAttribute("userList", userList);
		return "admin/ShowAllUser";
	}
	
	@RequestMapping("/admin/test.action")
	public String logout(HttpSession session){
		//将用户从session中删除
		session.removeAttribute("adminInfo");
		return "admin/adminfunction";
	}
	

}
