package com.oracle.ebp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;
import com.oracle.ebp.domain.TicketDetail2;
import com.oracle.ebp.domain.TicketDetailNum;
import com.oracle.ebp.service.TicketDetailService;
import com.oracle.ebp.service.TicketDetailService2;
import com.oracle.ebp.service.TicketService;

@Controller
public class TicketDetailController {
	@Resource
	TicketDetailService2 tds;
	@Resource
	TicketDetailService ticketds;
	@Resource
	TicketService ticketSvc;

	@RequestMapping("/ShowTicketDetail.action")
	public ModelAndView show(int tid) {
		ModelAndView mav = new ModelAndView();

		List<TicketDetailNum> list = new ArrayList<TicketDetailNum>();
		TicketDetail td = null;
		td = ticketds.retrieveByTid(tid);
		System.out.println(td);
		String descs = td.getDescs();
		String[] descses = descs.split("@");
		String images = td.getImages();
		String[] imageses = images.split(",");
		String[] sequence = td.getSequence().split(",");
		int j = 0;
		int k = 1;
		String img = imageses[0];
		for (int i = 1; i < sequence.length; i++) {
			if (sequence[i].equals("1")) {
				TicketDetailNum tdn = new TicketDetailNum();
				tdn.setSequence("1");
				String s = descses[j];
				tdn.setDescs(s);
				tdn.setImages(null);
				list.add(tdn);
				j++;
			}
			if (sequence[i].equals("2")) {
				TicketDetailNum tdn = new TicketDetailNum();
				tdn.setSequence("2");
				String s = imageses[k];
				tdn.setImages(s);
				tdn.setDescs(null);
				list.add(tdn);
				k++;
			}
		}
		Ticket ticket = ticketSvc.retrieveById(tid);
		System.out.println(list);
		TicketDetail2 TD2 = tds.retrieveByTicketid(tid);
		String first = TD2.getImages();
		mav.addObject("listall", list);
		
		mav.addObject("Ticket", ticket);
		mav.addObject("images", img);
		mav.addObject("first", first);
		mav.setViewName("loginsuccs");

		return mav;
	}


	@RequestMapping("/admin/insertTicketDetail.action")
	public String insert(Model model, HttpServletRequest sq,
			@Valid @ModelAttribute("ticketdetail") TicketDetail ticketdetail, Errors error) {
		Map<String, String> errors = new HashMap<String, String>();
		TicketDetail td = null;

		if (ticketdetail.getDescs() == null || ticketdetail.getDescs().equals("")) {
			errors.put("descs", "描述不能为空");
		}
		if (ticketdetail.getImages() == null || ticketdetail.getImages().equals("")) {
			errors.put("images", "图片路径不能为空");
		}

		if (ticketdetail.gettId() == 0) {
			errors.put("tid", "票ID不能为空");
		}
		if (ticketdetail.getSequence() == null || ticketdetail.getSequence().equals("")) {
			errors.put("sequence", "信息顺序不能为空");
		}
		if (ticketdetail.getSequence() == null || ticketdetail.getSequence().equals("")) {
			errors.put("sequence", "信息顺序不能为空");
		}
		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			return "admin/NewFile";
		}

		try {
			td = ticketds.retrieveByTid(ticketdetail.gettId());
			td.gettId();// 如果td不为空则有重复tid
			errors.put("tid", "插入重复");
			model.addAttribute("errors", errors);
			return "admin/ticketdetail";
		} catch (NullPointerException e) {

			ticketds.addDetail(ticketdetail);
			
			return "admin/NewFile";

		} catch (Exception e) {

			errors.put("GLOBAL", "插入有误");
			model.addAttribute("errors", errors);
			return "admin/NewFile";

		}
	}

	@RequestMapping(value = "/admin/AdminGetTicketDetail")
	public ModelAndView getticket(Integer tId, Integer currentPage, Integer pageSize, Integer recordCount) {
		if (currentPage == null || currentPage <= 0)
			currentPage = 1;
		if (pageSize == null)
			pageSize = 5;
		if (recordCount == null)
			recordCount = 0;
		ModelAndView mv = new ModelAndView();
		TicketDetail ticketdetail = new TicketDetail();
		int tid;
		if (tId == null) {
			tid = 0;
		} else {
			tid = tId;
		}
		ticketdetail.settId(tid);
		System.out.println(ticketdetail);
		try {
			mv.addObject("pageBean", ticketds.retrieveLike(currentPage, pageSize, recordCount, ticketdetail));
			mv.setViewName("admin/ticketdetail");
			return mv;
		} catch (NullPointerException e) {
			mv.addObject("pageBean", ticketds.retrieveLike(currentPage, pageSize, recordCount, ticketdetail));
			mv.setViewName("admin/ticketdetail");
			return mv;
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/admin/AdminGetTicketDetailById")
	public ModelAndView getticketbyid(int tId) {

		System.out.println("asdasdasda");
		ModelAndView mav = new ModelAndView();
		TicketDetail ticket2 = null;
		ticket2 = ticketds.retrieveByTid(tId);
		mav.addObject("ticketdetail", ticket2);
		mav.setViewName("admin/UpdateTicketDetail");
		return mav;
	}

	@RequestMapping("/admin/UpdateTicketTicketDetailId")
	public String update(Model model, HttpServletRequest sq,
			@Valid @ModelAttribute("ticketdetail") TicketDetail ticketdetail, Errors error) {
		Map<String, String> errors = new HashMap<String, String>();
		try {

			ticketds.update(ticketdetail);

		} catch (NullPointerException e) {

			return "admin/UpdateTicketDetail";
		} catch (Exception e) {
			errors.put("GLOBAL", "修改有误");
			model.addAttribute("errors", errors);
			return "admin/UpdateTicketDetail";
		}
		errors.put("GLOBAL", "修改成功");
		model.addAttribute("errors", errors);
		return "admin/UpdateTicketDetail";
	}

	

	@RequestMapping("/admin/TicketDetailInsert")
	public ModelAndView insert(TicketDetail2 ticketdetail) {
		Map<String, String> errors = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		if (ticketdetail.getImages() == null || ticketdetail.getImages().equals("")) {
			errors.put("images", "图片路径不能为空");
		}

		if (ticketdetail.getTicketid() == 0) {
			errors.put("tid", "票ID不能为空");
		}

		if (errors.size() > 0) {
			mav.addObject("errors", errors);
			mav.setViewName("admin/ADDdetail");
			return mav;
		}

		int id = ticketdetail.getTicketid();
		TicketDetail2 td2 = tds.retrieveByTicketid(id);
		try {
			td2.getTicketid();
			errors.put("GLOBAL", "插入重复");
			mav.addObject("errors", errors);
			mav.setViewName("admin/loginsucc");
			return mav;
		} catch (NullPointerException e2) {
			Ticket ticket = ticketSvc.retrieveById(id);
			try {
				ticket.getTid();
				System.out.println(ticketdetail);
				tds.addDetail(ticketdetail);
			} 
			catch (NullPointerException e) {

				errors.put("GLOBAL", "没有此票");
				mav.addObject("errors", errors);
				mav.setViewName("admin/loginsucc");
				return mav;

			} 
			catch (Exception e) {
				errors.put("GLOBAL", "没有此票");
				mav.addObject("errors", errors);
				mav.setViewName("admin/loginsucc");
				return mav;
			}
			mav.setViewName("admin/ADDdetail");
			return mav;
		}
	}

}
