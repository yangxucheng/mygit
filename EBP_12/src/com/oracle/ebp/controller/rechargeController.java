package com.oracle.ebp.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.ebp.domain.RechargeBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.service.UserService;
import com.oracle.ebp.util.constant.Constant;
//import com.oracle.ebp.util.tools.Md5;
import com.oracle.ebp.exception.LoginException;


@Controller
public class rechargeController {
		@Resource
		private UserService userSVC;
		@RequestMapping(value = "/user/recharge.action" ,method = RequestMethod.POST)
		public String Recharge(@Valid @ModelAttribute("rechargeBean")RechargeBean rb , Errors errors,HttpSession session,HttpServletRequest request) throws LoginException{
        if(errors.hasFieldErrors()) return "user/recharge";
		User user = null;
			try{
				String str=request.getParameter("type");
				session.setAttribute("type", str);
				String money=request.getParameter("ammount");
				session.setAttribute("money", money);
				user =(User) session.getAttribute(Constant.SESSION_USER);
//				if(user == null || !user.getPassword().equals(rb.getPassword())){
//				errors.reject("password","密码不正确");
//				return "recharge";
//				}
				
				Double i=user.getBalance()+rb.getAmmount();
				user.setBalance(i);
				
				userSVC.updateBalance(user);
				session.setAttribute("session_user", user);
				session.setAttribute("type", request.getAttribute("type"));
				return "user/TopUpSucc";
			}catch(Exception e){
				errors.reject("","登录出现异常");
				return "user/recharge";
			}
		}
}
		
	