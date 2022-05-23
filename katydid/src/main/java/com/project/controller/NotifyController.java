package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.NotifyVO;
import com.project.service.Notify.NotifyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/notify")
public class NotifyController {
	
	@Autowired
	private NotifyService service;
	
	@GetMapping("/list")
	public void getNotifyList(Model model) {
		
		model.addAttribute("notifyList", service.getList());
		
	}
	
	@GetMapping("/detail/{nno}")
	public String getNotifyDetail(@PathVariable Long nno, Model model) {
		
		model.addAttribute("detail", service.select(nno));
		
		return "/notify/detail";
	}
	
	@GetMapping("/insert")
	public void addNotify() {
		
	}
	
	@PostMapping("/insert")
	public String addNotifyPost(NotifyVO vo) {
		
		service.insert(vo);
		
		return "redirect:/notify/list";
	}
	
	@GetMapping("/update/{nno}")
	public String updateNotify(@PathVariable Long nno, Model model) {

		model.addAttribute("update", service.select(nno));
		
		return "/notify/update";
	}
	
	@PostMapping("/update")
	public String updateNotifyPost(NotifyVO vo) {
		
		service.update(vo);
		
		return "redirect:/notify/list";
	}
	
	@PostMapping("/delete/{nno}")
	public String delete(@PathVariable Long nno) {
		
		service.delete(nno);
		
		return "redirect:/notify/list";
	}

}
