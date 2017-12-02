package com.oracle.ebp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.oracle.ebp.domain.TicketDetail;

public class OrderListController {
//	public void temp(TicketDetail ticketdetail, Map<String, String> errors)
//	{
//		TicketDetail td = null;
//	if (ticketdetail.getDescs() == null || ticketdetail.getDescs().equals("")) {
//		errors.put("descs", "描述不能为空");
//	}
//	if (ticketdetail.getImages() == null || ticketdetail.getImages().equals("")) {
//		errors.put("images", "图片路径不能为空");
//	}
//
//	if (ticketdetail.gettId() == 0) {
//		errors.put("tid", "票ID不能为空");
//	}
//	if (ticketdetail.getSequence() == null || ticketdetail.getSequence().equals("")) {
//		errors.put("sequence", "信息顺序不能为空");
//	}
//
//	}
}
