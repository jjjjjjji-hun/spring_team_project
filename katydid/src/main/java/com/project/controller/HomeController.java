package com.project.controller;



import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.BoardVO;
import com.project.domain.NotifyVO;
import com.project.domain.SearchCriteria;
import com.project.service.Notify.NotifyService;
import com.project.service.board.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private NotifyService notifyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, SearchCriteria cri, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<BoardVO> boardList = service.getList(cri);
		
		model.addAttribute("boardList", boardList);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<NotifyVO> vo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", vo);
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/chatting")
	public String chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		return "chat";
	}
	
	
}
