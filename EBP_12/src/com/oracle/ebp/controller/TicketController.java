package com.oracle.ebp.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ebp.domain.DetailShow;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;
import com.oracle.ebp.domain.TicketDetail2;
import com.oracle.ebp.domain.TicketNum;
import com.oracle.ebp.service.TicketDetailService;
import com.oracle.ebp.service.TicketDetailService2;
import com.oracle.ebp.service.TicketService;

@Controller
public class TicketController {
	@Resource
	TicketService ticketservice;
	@Resource
	TicketDetailService TDS;
	@Resource
	TicketDetailService2 TDS2;

	@RequestMapping("/admin/AddTicket.action")
	public String addTicket(Model model, @Valid @ModelAttribute("detailshow") DetailShow detailshow, Errors errors,HttpSession session) {// 紧接
		Map<String, String> error = new HashMap<String, String>();
		System.out.println("adsdasdas");
		if (detailshow.getAmount() < detailshow.getBalance()) {
			System.out.println("asad++++++");
			error.put("GLOBAL", "剩余票数不能大于总票数");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		}
		if (detailshow.getStatus() != 0 && detailshow.getStatus() != 1) {
			System.out.println("asad--------");
			error.put("GLOBAL", "票的状态只能为0或1");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		}
		if (detailshow.getAmount() < 0 || detailshow.getBalance() < 0) {
			System.out.println("asad++++++");
			error.put("GLOBAL", "票数不能小于零");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		}
		if (detailshow.getPrice() < 0) {
			System.out.println("asad++++++");
			error.put("GLOBAL", "单价不能小于零");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		}

		System.out.println("asad++++++" + detailshow.getStatus());
		Ticket tick = new Ticket();
		TicketDetail ticketdetail = new TicketDetail();
		TicketDetail2 ticketdetail2 = new TicketDetail2();

		String descs;
		int tid;
		try {

			descs = detailshow.getDescs();
			Date startTime = detailshow.getStartTime();
			int amount = detailshow.getAmount();
			int balance = detailshow.getAmount();
			double price = detailshow.getPrice();
			int status = detailshow.getStatus();

			tick.setAmount(amount);
			tick.setBalance(balance);
			tick.setDescs(descs);
			tick.setPrice(price);
			tick.setStatus(status);
			tick.setStartTime(startTime);
			int i = ticketservice.getallcount();
			tid = i + 1;
		} catch (Exception e) {
			error.put("GLOBAL", "插入格式有误");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		}
		Ticket ticket2 = ticketservice.retrieveByDescs(descs);
		try {
			ticket2.getBalance();
			error.put("GLOBAL", "插入数据重复");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		} catch (NullPointerException e) {

			tick.setTid(tid);
			ticketservice.insert(tick);

			int ticketid = tid;
			String Images = detailshow.getImages();
			ticketdetail2.setImages(Images);
			ticketdetail2.setTicketid(ticketid);
			TDS2.addDetail(ticketdetail2);

			int tId = tid;
			String images2 = detailshow.getImages2();
			String sequence = detailshow.getSequence();
			String descs2 = detailshow.getDescs2();
			ticketdetail.setDescs(descs2);
			ticketdetail.setImages(images2);
			ticketdetail.setSequence(sequence);
			ticketdetail.settId(tId);
			try{
				TDS.addDetail(ticketdetail);
				TicketDetail Td = TDS.retrieveByTid(tId);
				Td.getImages();
			}catch (Exception e2) {
				TDS2.Delete(tId);
				ticketservice.delete(tId);
				error.put("GLOBAL", "插入数据过长");
				session.setAttribute("sess", detailshow);
				model.addAttribute("errors", error);
				return "admin/NewFile";
				
			}
			error.put("GLOBAL", "插入成功");
			model.addAttribute("errors", error);
			session.setAttribute("sess", detailshow);
			return "admin/NewFile";
		}
	}

	@RequestMapping(value = "/admin/ListAllTickets.action")
	public String listAll(Model model) {
		try {
			List<Ticket> list = ticketservice.retrieveAll();
			System.out.println(list);
			model.addAttribute("ticketList", list);
			return "admin/tickets";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			return "admin/nottickets";
		}
	}

	@RequestMapping("/admin/AdminGetTicketById")
	public ModelAndView getticketbyid(int tid) {
		System.out.println("asdasdasda");
		ModelAndView mav = new ModelAndView();
		System.out.println(tid + "            sda");
		Ticket ticket2 = null;
		ticket2 = ticketservice.retrieveById(tid);
		TicketDetail2 ticket3 = TDS2.retrieveByTicketid(tid);
		System.out.println(ticket2);
		System.out.println("asdasdasda");
		mav.addObject("getTicketById", ticket2);
		mav.addObject("getTicketidById", ticket3);
		mav.setViewName("admin/AdminGetTicketById");
		return mav;
	}

	@RequestMapping(value = "/admin/UpdateStatus", method = RequestMethod.POST)
	public void UpdateStatus(Integer tid, HttpServletRequest request, HttpServletResponse res) {
		System.out.println("asdasdadsadasa111111111111111sda");
		System.out.println(tid + "            sda");
		Ticket ticket2 = null;
		ticket2 = ticketservice.retrieveById(tid);
		int i = ticket2.getStatus();
		if (i == 0) {
			ticketservice.UpdateStatusZero(tid);
		}
		if (i == 1) {
			ticketservice.UpdateStatusOne(tid);
		}
		System.out.println("asdasdasda");
		PrintWriter out;
		try {
			if (i == 1) {
				out = res.getWriter();
				out.write("已停售");
				out.flush();
				out.close();
			}
			if (i == 0) {
				out = res.getWriter();
				out.write("售票中");
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("/admin/AdminUpdateTicketById")
	public String update(Model model, HttpServletRequest sq, @Valid @ModelAttribute("detailshow") DetailShow ticket,
			Errors error) {
		Map<String, String> errors = new HashMap<String, String>();
		Ticket ticket2 = null;
		System.out.println(ticket.getStatus() + "dasda22222222222221");
		ticket2 = ticketservice.retrieveById(ticket.getTid());
		int status = ticket2.getStatus();
		int tid = ticket.getTid();
		String descs = ticket.getDescs();
		Date startTime = ticket.getStartTime();
		int amount = ticket.getAmount();
		int balance = ticket.getBalance();
		double price = ticket.getPrice();

		String images = ticket.getImages();
		System.out.println(ticket.getDescs());
		if (ticket.getAmount() < ticket.getBalance()) {
			System.out.println("asad++++++");
			errors.put("GLOBAL", "剩余票数不能大于总票数");
			model.addAttribute("errors", "剩余票数不能大于总票数");
			ticket2 = ticketservice.retrieveById(tid);
			model.addAttribute("getTicketById", ticket2);
			TicketDetail2 td2 = TDS2.retrieveByTicketid(tid);
			model.addAttribute("getTicketidById", td2);
			return "admin/AdminGetTicketById";
		}
		if (ticket.getStatus() != 0 && ticket.getStatus() != 1) {
			System.out.println("asad--------");
			errors.put("GLOBAL", "票的状态只能为0或1");
			model.addAttribute("errors", "票的状态只能为0或1");
			ticket2 = ticketservice.retrieveById(tid);
			model.addAttribute("getTicketById", ticket2);
			TicketDetail2 td2 = TDS2.retrieveByTicketid(tid);
			model.addAttribute("getTicketidById", td2);
			return "admin/AdminGetTicketById";
		}
		if (ticket.getAmount() < 0 || ticket.getBalance() < 0) {
			System.out.println("asad++++++");
			errors.put("GLOBAL", "票数不能小于零");
			model.addAttribute("errors", "票数不能小于零");
			ticket2 = ticketservice.retrieveById(tid);
			model.addAttribute("getTicketById", ticket2);
			TicketDetail2 td2 = TDS2.retrieveByTicketid(tid);
			model.addAttribute("getTicketidById", td2);
			return "admin/AdminGetTicketById";
		}
		if (ticket.getPrice() < 0) {
			System.out.println("asad++++++");
			errors.put("GLOBAL", "单价不能小于零");
			model.addAttribute("errors", "单价不能小于零");
			ticket2 = ticketservice.retrieveById(tid);
			model.addAttribute("getTicketById", ticket2);
			TicketDetail2 td2 = TDS2.retrieveByTicketid(tid);
			model.addAttribute("getTicketidById", td2);
			return "admin/AdminGetTicketById";
		}
		try {
			ticket2.getDescs();
			System.out.println("sadasdadasdasdasda");
			ticket.setStatus(ticket2.getStatus());
			Ticket tick = new Ticket();
			tick.setAmount(amount);
			tick.setBalance(balance);
			tick.setDescs(descs);
			tick.setPrice(price);
			tick.setTid(tid);
			tick.setStartTime(startTime);
			tick.setStatus(status);
			ticketservice.update(tick);

			TicketDetail2 TD2 = new TicketDetail2();
			TD2.setImages(images);
			TD2.setTicketid(tid);
			TDS2.Update(TD2);
		} catch (NullPointerException e) {
			errors.put("tid", "没有此票请重新选择");
			model.addAttribute("errors", "没有此票请重新选择");

			ticket2 = ticketservice.retrieveById(tid);
			model.addAttribute("getTicketById", ticket2);
			TicketDetail2 td2 = TDS2.retrieveByTicketid(tid);
			model.addAttribute("getTicketidById", td2);
			return "admin/AdminGetTicketById";
		} catch (Exception e) {
			System.out.println("修改有误");
			System.out.println(e.getMessage());
			errors.put("GLOBAL", "修改有误");
			model.addAttribute("errors", "修改有误");

			ticket2 = ticketservice.retrieveById(tid);
			model.addAttribute("getTicketById", ticket2);
			TicketDetail2 td2 = TDS2.retrieveByTicketid(tid);
			model.addAttribute("getTicketidById", td2);
			return "admin/AdminGetTicketById";
		}
		errors.put("GLOBAL", "修改成功");
		model.addAttribute("errors","修改成功");

		System.out.println(ticket.getStatus() + "dasda11111111111");
		return "admin/AdminGetTicketById";
	}

	@RequestMapping("/admin/DeleteTicket.action")
	public ModelAndView delete(int tid) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> errors = new HashMap<String, String>();
		Ticket ticket = null;
		ticket = ticketservice.retrieveById(tid);

		try {
			ticket.getDescs();
			ticketservice.delete(tid);
			ticketservice.updatetid(tid);
			List<Ticket> list = ticketservice.retrieveAll();
			mav.addObject("ticketList", list);
		} catch (NullPointerException e) {
			System.out.println(ticket.getDescs());
			errors.put("descs", "无此票项");
			mav.addObject("errors", errors);
			mav.setViewName("admin/tickets");
			return mav;
		} catch (Exception e) {
			errors.put("GLOBAL", e.getMessage());
			mav.addObject("errors", errors);
			mav.setViewName("admin/tickets");
			return mav;
		}
		mav.setViewName("admin/tickets");
		return mav;
	}

	@RequestMapping("/admin/SelectTicket.action")
	public ModelAndView SelectTicket(@Valid @ModelAttribute("ticketnum") TicketNum ticket, Errors errors,
			Integer currentPage, Integer pageSize, Integer recordCount) {

		if (currentPage == null || currentPage <= 0)
			currentPage = 1;
		if (pageSize == null)
			pageSize = 8;
		if (recordCount == null)
			recordCount = 0;
		ModelAndView mv = new ModelAndView();
		System.out.println(ticket);
		mv.addObject("pageBean", ticketservice.retrieveLike(currentPage, pageSize, recordCount, ticket));
		System.out.println(ticketservice.retrieveLike(currentPage, pageSize, recordCount, ticket));
		mv.setViewName("admin/UpdateTickets");
		return mv;
 
	}
	@RequestMapping("/SelectTicket2.action")
	public ModelAndView SelectTicket2(@Valid @ModelAttribute("ticketnum") TicketNum ticket, Errors errors,
			Integer currentPage, Integer pageSize, Integer recordCount) {

		if (currentPage == null || currentPage <= 0)
			currentPage = 1;
		if (pageSize == null)
			pageSize = 8;
		if (recordCount == null)
			recordCount = 0;
		ModelAndView mv = new ModelAndView();
		System.out.println(ticket);
		if(ticket.getDescs()==null){
			ticket = new TicketNum(0, "", null, null);
		    	
		}System.out.println(ticket);
		mv.addObject("pageBean", ticketservice.retrieveLike(currentPage, pageSize, recordCount, ticket));
		System.out.println(ticketservice.retrieveLike(currentPage, pageSize, recordCount, ticket));
		mv.setViewName("user/tickets");
		return mv;

	}

	@RequestMapping("/admin/SelectTicketShow.action")
	public ModelAndView ShowSelectTicket(@Valid @ModelAttribute("ticketnum") TicketNum ticket, Errors errors,
			Integer currentPage, Integer pageSize, Integer recordCount) {

		if (currentPage == null || currentPage <= 0)
			currentPage = 1;
		if (pageSize == null)
			pageSize = 8;
		if (recordCount == null)
			recordCount = 0;
		ModelAndView mv = new ModelAndView();
		System.out.println(ticket);
		mv.addObject("pageBean", ticketservice.retrieveLike(currentPage, pageSize, recordCount, ticket));
		System.out.println(ticketservice.retrieveLike(currentPage, pageSize, recordCount, ticket));
		mv.setViewName("admin/UpdateTickets");
		return mv;

	}
	
	
	
	
	
	
	
	@RequestMapping("/admin/SelectTicket3.action")
	public ModelAndView Select(@Valid @ModelAttribute("ticketnum") TicketNum ticket,int number, Errors errors) {

		System.out.println(number);
		ModelAndView mv = new ModelAndView();
		System.out.println(ticket);
			mv.setViewName("admin/UpdateTickets");
		return mv;
 
	}

}
