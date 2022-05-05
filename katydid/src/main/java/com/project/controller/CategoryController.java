package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.AreaVO;
import com.project.domain.CategoryVO;
import com.project.domain.L_kindVO;
import com.project.domain.S_kindVO;
import com.project.service.category.CategoryService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryservice;
	
	@GetMapping("/list")
	public String categoryList(Model model) {
		log.info("카테고리 리스트");
		model.addAttribute("areaList", categoryservice.getAreaList());
		
		model.addAttribute("l_kindList", categoryservice.getLkindList());
		
		model.addAttribute("s _kindList", categoryservice.getSkindList());
		
		model.addAttribute("categoryList", "");
		
		return "category/categoryList";
	}
	
	@GetMapping("/")
	public String categoryInsertForm() {
		
		return "category/categoryForm";
	}
	
	// 분류 추가
	@PostMapping("/area")
	public String areaInsert(AreaVO vo) {
		if (vo != null) {
			categoryservice.insertArea(vo);
		}
		
		return "redirect:list/";
	}
	
	@PostMapping("/lkind")
	public String lkindInsert(L_kindVO vo) {
		if (vo != null) {
			categoryservice.insertLkind(vo);
		}
		
		return "redirect:list/";
	}
	
	@PostMapping("/skind")
	public String skindInsert(S_kindVO vo) {
		if (vo != null) {
			categoryservice.insertSkind(vo);
		}
		
		return "redirect:list/";
	}
	
	@PostMapping("/category")
	public String categoryInsert(CategoryVO vo) {
		
		
		return "redirect:list/";
	}
	
	// 분류 삭제
	@DeleteMapping("/")
	public String category(Long num) {
		
		return "redirect:list/";
	}
	
}
