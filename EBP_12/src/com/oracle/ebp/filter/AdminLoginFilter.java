package com.oracle.ebp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.util.constant.Constant;

public class AdminLoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest)arg0;
	        HttpSession session = req.getSession();
	        
	        String requestURI = req.getRequestURI();
	        //以下尝试截取用户拟请求的目标路径
	        String uri = requestURI.substring(requestURI.indexOf(Constant.ADMIN_PREFIX));
	        //用户既不是请求登录，也不是请求注册时，进行拦截
	        if (uri.indexOf(Constant.LOGIN_KEYWORD) == -1) {
	            Admin admin = (Admin)session.getAttribute(Constant.SESSION_ADMIN);
	            if (admin == null) {
	                String loginUri = req.getContextPath() + Constant.ADMIN_PREFIX + Constant.ADMINLOGIN_PAGE;
	                ((HttpServletResponse)arg1).sendRedirect(loginUri);
	                return;                   
	            } 
	        }
	        arg2.doFilter(arg0, arg1);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
