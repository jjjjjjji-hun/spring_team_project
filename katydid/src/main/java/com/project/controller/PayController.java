package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.NotifyVO;
import com.project.domain.PayVO;
import com.project.service.Notify.NotifyService;
import com.project.service.store.StoreService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/pay")
public class PayController {
	
	@Autowired
	private StoreService storeservice;
	
	@Autowired
	private NotifyService notifyservice;
	
	@GetMapping("/payForm")
	public String payList(Long stno, Model model) {
		
		List<NotifyVO> vo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", vo);
		model.addAttribute("menuList", storeservice.listMenu(stno));
		return "pay/payForm";
	}
	
	@ResponseBody
	@PostMapping(value="/order", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> orderInsert(@RequestBody PayVO vo){
		log.info("VO검증" + vo);
		storeservice.insertPay(vo);
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
}
