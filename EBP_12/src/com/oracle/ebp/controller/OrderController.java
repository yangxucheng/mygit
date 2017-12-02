package com.oracle.ebp.controller;
import java.sql.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ebp.domain.NewOrder;
import com.oracle.ebp.domain.PageBean;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.service.OrderService;
import com.oracle.ebp.service.TicketService;
import com.oracle.ebp.service.UserService;
import com.oracle.ebp.util.constant.Constant;
@Controller
public class OrderController {
	@Resource
	TicketService ticketSvc;
	@Resource
	UserService userSvc;
	@Resource
	OrderService orderSvc;
@RequestMapping(value="/user/pageselect.action")
public ModelAndView getOrderById(Integer currentPage,Integer pageSize,Integer recordCount,HttpSession session){
	User user = (User) session.getAttribute(Constant.SESSION_USER);
	if (currentPage==null || currentPage<=0) currentPage=1;
	if(pageSize==null)pageSize=3;
	if(recordCount==null)recordCount=0;
	ModelAndView mv=new ModelAndView();
	mv.addObject("pageBean",orderSvc.getOrderPaging(currentPage, pageSize, recordCount, user.getUid()));
	mv.setViewName("user/ajaxselectOrder");
	return mv;
}

@RequestMapping(value="/deleteOrder.action")
public ModelAndView deleteOrder(HttpServletRequest request,Boolean ajax,HttpSession session){
	Integer oid =Integer.parseInt(request.getParameter("oid"));
	Integer currentPage = Integer.parseInt(request.getParameter("currentPage"));
	Integer pageSize =  Integer.parseInt(request.getParameter("pageSize"));
	Integer recordCount = Integer.parseInt(request.getParameter("recordCount"));
	ModelAndView mv=new ModelAndView();
	try{
		User user =  (User) session.getAttribute(Constant.SESSION_USER); //再次查询
		orderSvc.deleteOrderlist(oid);
		orderSvc.deleteOrder(oid);//删除
		if (currentPage==null || currentPage<=0) currentPage=1;
		if(pageSize==null)pageSize=3;
		if(recordCount==null)recordCount=0;
		PageBean pageBean = orderSvc.getOrderPaging(currentPage, pageSize, recordCount-1, user.getUid());
		mv.addObject("pageBean",orderSvc.getOrderPaging(currentPage, pageSize, recordCount-1, user.getUid()));
		mv.setViewName("ajaxselectOrder");
		
	}catch(Exception e){
		System.out.println(e.toString()+" "+"123");
	}
	return mv;
}
@RequestMapping(value="/showdetails.action")
public String showDetail(Model model,HttpServletRequest request,HttpSession session){
	int oid =Integer.parseInt(request.getParameter("oid"));
	User user = (User) session.getAttribute(Constant.SESSION_USER);;
	int uid = user.getUid();
	NewOrder order = orderSvc.showDetails(oid, uid);
	System.out.println(order.getUser());
	Ticket ticket = ticketSvc.retrieveById(order.getOrderlist().gettId());
	model.addAttribute("orderdetails", order);
	model.addAttribute(ticket);
	return "orderdetails";
	
}
@RequestMapping("/admin/ShowAllorder.action")
public ModelAndView showallorders(Model model){
	ModelAndView mav= new ModelAndView();
	List<NewOrder> list= orderSvc.retrieveAllOrder();
	
	model.addAttribute("list",list);
	mav.setViewName("admin/ShowAllOrder");
	return mav;
    }

@RequestMapping(value = "/selectByname.action", method = RequestMethod.POST)
public String selectByInput(HttpServletRequest request,Model model){
	try{
		
//		System.out.println("number="+number);
//		System.out.println(number.getClass());
		String number = request.getParameter("number");
		String name=request.getParameter("name");
		String idCard=request.getParameter("idCard");
		List<NewOrder> list=null;
		int a=0;
		if(number.trim().equals("")||number==null){
			
			list=orderSvc.selectorderByInput(a,name, idCard);
			System.out.println(list.toString());
		}else{
			int b=Integer.parseInt(number);
			list=orderSvc.selectorderByInput(b,name, idCard);
			
		}
			
			model.addAttribute("list",list);
			return "admin/ShowAllOrder";
	}catch (Exception e) {
		System.out.println(e.getMessage());
		return "admin/ShowAllOrder";
		
	}
}

@RequestMapping(value = "/selectByTime.action", method = RequestMethod.POST)
public String selectByTime(String begin,String end,Model model){
	try{
		System.out.println(begin);
	List<NewOrder> list=orderSvc.queryOrdersByDatePage(begin, end);
	model.addAttribute("list",list);
	return "admin/ShowAllOrder";
	}catch (Exception e) {
		System.out.println(e.getMessage());
		return "admin/ShowAllOrder";
	}
}

}
