package com.oracle.ebp.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderList;
import com.oracle.ebp.domain.PageBean;
import com.oracle.ebp.domain.ShoppingCart;
import com.oracle.ebp.domain.ShoppingCartDetail;
import com.oracle.ebp.domain.ShoppingCartDetailTicket;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail2;
import com.oracle.ebp.domain.TicketDetailNum;
import com.oracle.ebp.domain.TicketNum;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.service.ShoppingCartDetailService;
import com.oracle.ebp.service.TicketDetailService2;
import com.oracle.ebp.service.TicketService;
import com.oracle.ebp.util.constant.Constant;

@Controller
public class ShoppingCartDetailController {
	     @Resource
	     ShoppingCartDetailService shoppingcardetailtSvc;
	     @Resource
	     TicketService ticketSvc;
	     @Resource
	     TicketDetailService2 TDS2;
	     @RequestMapping("/user/tickets.action")
	     public String insert_Shoppingcart(@Valid @ModelAttribute("shoppingcartdetail")ShoppingCart shoppingcart,Errors errors,HttpServletRequest request,Model model,HttpSession session){
	    	 User userinfo=(User) session.getAttribute(Constant.SESSION_USER);
	    	 
	    	 
	    	 if(errors.hasFieldErrors()) {
	    		 System.out.println("有错误");
	    		 return "user/tickets";
	    	 }
	    	 try{
	    		 
	    		 String str=request.getParameter("tid");
	    		 String number=request.getParameter("number");
	    		 int tid=Integer.parseInt(str);
	    		 int num=Integer.parseInt(number);
	    		 System.out.println(num);
	    		 int balance=shoppingcardetailtSvc.get_TicketBalance(tid);
	    		 System.out.println(balance);
	    		 if(num<=0){
	    			 model.addAttribute("numerror","请选择正确的票数");
	    			 List<Ticket> list=shoppingcardetailtSvc.retrieveAllTicket();
	    			 model.addAttribute("list", list);
	    			 TicketNum tick = new TicketNum(0,"",null,null);
    				 PageBean pageBean =ticketSvc.retrieveLike(1, 8, 0, tick);
    				 model.addAttribute("pageBean", pageBean);
	    			 return "user/tickets";
	    		 }
	    		 
	    		 else if(num>balance){
	    			 model.addAttribute("numerror","选择票数过多");
	    			 
	    			 List<Ticket> list=shoppingcardetailtSvc.retrieveAllTicket();
	    			 model.addAttribute("list", list);TicketNum tick = new TicketNum(0,"",null,null);
    				 PageBean pageBean =ticketSvc.retrieveLike(1, 8, 0, tick);
    				 model.addAttribute("pageBean", pageBean);
	    			 
	    			 return "user/tickets";
	    		 }
	    		 else{
	    			 ShoppingCartDetail scd = null;
	    			 scd=shoppingcardetailtSvc.selectShoppingCartbyUid(userinfo.getUid(),tid);
	    			 	 if(scd!=null){
	    				 ShoppingCartDetail scds=new ShoppingCartDetail(scd.getScdid(),scd.getScid(),scd.gettId(),scd.getQuantity()+num);
	    				 shoppingcardetailtSvc.updateshoppingTicketnumber(scds);
	    				 System.out.println("hello");
	    				 List<Ticket> list=shoppingcardetailtSvc.retrieveAllTicket();
	    				 TicketNum tick = new TicketNum(0,"",null,null);
	    				 PageBean pageBean =ticketSvc.retrieveLike(1, 8, 0, tick);
	    				 model.addAttribute("pageBean", pageBean);
		    			 model.addAttribute("list", list);
		    			 model.addAttribute("succ", "添加购物车成功");
	    				 return "user/tickets";
	    			 }
	    			 	 else{
	    				 ShoppingCartDetail a=null;
	    				 if(userinfo.getUid()==1)
	    			   a = new ShoppingCartDetail(-1,userinfo.getUid(),tid,num);//需修改
	    				 else{
	    					 System.out.println(userinfo.getUid());
	    			 a = new ShoppingCartDetail(-1,userinfo.getUid(),tid,num);}//需修改
		    		 shoppingcardetailtSvc.insert_shoppingcardetail(a);
		    		 List<Ticket> list=shoppingcardetailtSvc.retrieveAllTicket();
	    			 model.addAttribute("list", list);
	    			 TicketNum tick = new TicketNum(0,"",null,null);
    				 PageBean pageBean =ticketSvc.retrieveLike(1, 8, 0, tick);
    				 model.addAttribute("pageBean", pageBean);
		    		 model.addAttribute("succ", "添加购物车成功");
		    		 return  "user/tickets";
	    			 }
		    		 
	    		 }	 
	    	 }catch (Exception e) {
	    		 System.out.println(e.getMessage());
	    		 System.out.println("插入失败");
	    		 List<Ticket> list=shoppingcardetailtSvc.retrieveAllTicket();
    			 model.addAttribute("list", list);
    			 TicketNum tick = new TicketNum(0,"",null,null);
				 PageBean pageBean =ticketSvc.retrieveLike(1, 8, 0, tick);
				 model.addAttribute("pageBean", pageBean);
				return "user/tickets";
			}
	     }
	     
	     @RequestMapping("/user/gotoshoppingcart.action")
	     public String goto_Shoppingcart(Model model, HttpSession session){
	    	 try{
	    		 User userinfo=(User) session.getAttribute(Constant.SESSION_USER);
	    		 User user = shoppingcardetailtSvc.get_UserByUid(userinfo.getUid());
	    		 session.setAttribute("session_user", user);
	    		 List<ShoppingCartDetailTicket> list= shoppingcardetailtSvc.showShoppingDetailAndTicket(userinfo.getUid());

	    		 List<TicketDetail2> detail = new ArrayList<TicketDetail2>();
	    		 for (ShoppingCartDetailTicket sdt:list){
	    			 detail.add(TDS2.retrieveByTicketid(sdt.getTid()));
	    			 System.out.println(detail);
	    			
	    		 }
		 
	    		 model.addAttribute("detail",detail);
	    		 model.addAttribute("list",list);
	    		 return  "user/showShoppingBody";
	    	 }catch (Exception e) {
	    		 System.out.println(e.getMessage());
				return "index";
			}
	     }
	     
	     @RequestMapping("/user/continueshopping.action")
	     public String continue_Shoppingcart(Model model){
	    	 return "index";
	     }
	     
	     
	     @RequestMapping("/user/deleteAction.action")
	     public String delete_shoppingcart(@Valid @ModelAttribute("shoppingcart")ShoppingCart shoppingcart,Errors errors,HttpSession session,HttpServletRequest request,Model model){
	    	 if(errors.hasFieldErrors()) {
	    		 System.out.println("有错误");
	    		 return "user/showShoppingBody";
	    	 }
	    	 try{
	    		 String str=request.getParameter("tid");
	    		 int tid=Integer.parseInt(str);
	    		 shoppingcardetailtSvc.deleteByTid(tid);
	    		 User userinfo=(User) session.getAttribute(Constant.SESSION_USER);
	    		 List<ShoppingCartDetailTicket> list= shoppingcardetailtSvc.showShoppingDetailAndTicket(userinfo.getUid());
	    		 List<TicketDetail2> detail = new ArrayList<TicketDetail2>();
	    		 for (ShoppingCartDetailTicket sdt:list){
	    			 detail.add(TDS2.retrieveByTicketid(sdt.getTid()));
	    			 System.out.println(detail);
	    			
	    		 }
		 
	    		 model.addAttribute("detail",detail);
	    		 model.addAttribute("list",list);
	    		 return "user/showShoppingBody";
	    	 }catch (Exception e) {
				System.out.println("删除失败");
				return "user/showShoppingBody";
			}
	     }
	     
	     @RequestMapping("/user/payforshopping.action")
	     public String payforshopping(@Valid @ModelAttribute("shoppingcart")ShoppingCart shoppingcart,Errors error,HttpServletRequest request,Model model,HttpSession session){
	    	 Date date= new Date(System.currentTimeMillis());
	    	 User userinfo=(User) session.getAttribute(Constant.SESSION_USER);
	    	 
	    	 if(error.hasFieldErrors()) {
	    		 System.out.println("有错误");
	    		 return "user/showShoppingBody";
	    	 }
	    	 try{
	    		 List<ShoppingCartDetailTicket> lists= shoppingcardetailtSvc.showShoppingDetailAndTicket(userinfo.getUid());
	    		 String descs="";
	    		 double price=0;
	    		 int quantity=0;
	    		 int retain=0;//剩余票数
	    		 String str=request.getParameter("tids");
	    		 int tid=Integer.parseInt(str);	 
	    		 double allprice = 0;
	    		 Ticket tic=ticketSvc.retrieveById(tid);
	    		 retain = tic.getBalance();
	    		 for(ShoppingCartDetailTicket scdt:lists){
	    			 if(scdt.getTid()==tid){
	    				 allprice=scdt.getPrice()*scdt.getQuantity();
	    				 descs=scdt.getDescs();
	    				 price=scdt.getPrice();
	    				 quantity=scdt.getQuantity(); 
	    				 
	    			 }
	    		 }
	    		 
	    		 double balance= shoppingcardetailtSvc.get_userbalance(userinfo.getUid());
	    		 //有问题
	    		  User user = shoppingcardetailtSvc.get_UserByUid(userinfo.getUid());	 
	    		 if(allprice<=balance){
	    			 Order order=new Order(-1,date,allprice,userinfo.getUid());
	    			 int oids =shoppingcardetailtSvc.insert_order(order);//生成订单
                     oids=shoppingcardetailtSvc.get_Maxoid();
	    			 OrderList orderlist = new OrderList(-1,descs,price,quantity,allprice,oids,tid);//有问题
	    			 double newbalance=balance-allprice;
	    			 user.setBalance(newbalance);
	    			 shoppingcardetailtSvc.set_newuserbalance(user);
	    			 shoppingcardetailtSvc.deleteByTid(tid);
//		    		 List<ShoppingCartDetailTicket> list= shoppingcardetailtSvc.showShoppingDetailAndTicket();
//		    		 model.addAttribute("list",list);//展示所有
		    		 
	    			 shoppingcardetailtSvc.insert_orderlist(orderlist);//生成订单详情
	    			 Ticket ticket=new Ticket(tid,"",null,0,retain-quantity,0,1);
	    			 shoppingcardetailtSvc.set_newTicketbalance(ticket);//设置剩余票数
	    			 List<Order> orders = shoppingcardetailtSvc.retrieveorderByUid(userinfo.getUid());
	    			 model.addAttribute("orders",orders);
	    			 List<OrderList> list = shoppingcardetailtSvc.retrieveorderlistByOid(oids);
	    			 model.addAttribute("list",list);
                     return "/user/ShoppingSuccess";
	    		 }else{
	    			 System.out.println("金额不足");
	    			 error.reject("","金额不足");
	    			 return "user/recharge";
	    		 }
	    	 }catch (Exception e) {
				System.out.println(e.getMessage());
				return "user/showShoppingBody";
			}
	     }
	     
	     @RequestMapping("/user/backshoppingcart.action")
	     public String back_Shoppingcart(HttpSession session,Model model){
	    	 User userinfo=(User) session.getAttribute(Constant.SESSION_USER);
	    	 List<ShoppingCartDetailTicket> list= shoppingcardetailtSvc.showShoppingDetailAndTicket(userinfo.getUid());
   		     model.addAttribute("list",list);//展示所有
	    	 return "user/showShoppingBody";
	     }
	     
	     @RequestMapping("/user/backshopping.action")
	    	 public String back_Shopping(Model model){
		    	 return "index";
		     }
	     
	}

