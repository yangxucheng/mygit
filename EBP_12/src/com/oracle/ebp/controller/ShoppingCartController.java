package com.oracle.ebp.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ebp.domain.ShoppingCart;
import com.oracle.ebp.service.ShoppingCartService;


//@Controller
public class ShoppingCartController {
//     @Resource
//     ShoppingCartService shoppingcartSvc;
//     @RequestMapping("/user/ShowTickets.action")
//     public String insert_Shoppingcart(@Valid @ModelAttribute("shoppingcart")ShoppingCart shoppingcart,Errors errors,HttpServletRequest request,Model model){
//    	 if(errors.hasFieldErrors()) {
//    		 System.out.println("有错误");
//    		 return "index";
//    	 }
//    	 try{
//    		 String str=request.getParameter("tid");
//    		 Date date=new Date(System.currentTimeMillis());
//    		 int scid=Integer.parseInt(str);
//    		 System.out.println(scid);
//    		 ShoppingCart a = new ShoppingCart(scid,date,1);
//    		 shoppingcartSvc.insert_shoppingcar(a);
//    		 return  "index";
//    	 }catch (Exception e) {
//    		 System.out.println(e.getMessage());
//    		 System.out.println("插入失败");
//			return "index";
//		}
//     }
//     
//     @RequestMapping("/user/gotoshoppingcart.action")
//     public String goto_Shoppingcart(Model model){
//    	 try{
//    		 List<ShoppingCart> list= shoppingcartSvc.retrieveAll();
//    		 model.addAttribute("list",list);
//    		 return  "user/ShowTickets";
//    	 }catch (Exception e) {
//    		 System.out.println(e.getMessage());
//			return "index";
//		}
//     }
//     
//     @RequestMapping("/user/continueshopping.action")
//     public String continue_Shoppingcart(Model model){
//    	 return "index";
//     }
//     
//     
//     @RequestMapping("/user/deleteAction.action")
//     public String delete_shoppingcart(@Valid @ModelAttribute("shoppingcart")ShoppingCart shoppingcart,Errors errors,HttpServletRequest request,Model model){
//    	 if(errors.hasFieldErrors()) {
//    		 System.out.println("有错误");
//    		 return "user/ShowTickets";
//    	 }
//    	 try{
//    		 String str=request.getParameter("tid");
//    		 int tid=Integer.parseInt(str);
//    		 shoppingcartSvc.deleteByTid(tid);
//    		 List<ShoppingCart> list= shoppingcartSvc.retrieveAll();
//    		 model.addAttribute("list",list);
//    		 return "user/ShowTickets";
//    	 }catch (Exception e) {
//			System.out.println("删除失败");
//			return "user/ShowTickets";
//		}
//     }
}
