package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.AreaVO;
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
		
		model.addAttribute("s_kindList", categoryservice.getSkindList());
		
		return "category/categoryList";
	}
	
	@GetMapping("/")
	public String categoryInsertForm() {
		
		return "category/categoryForm";
	}
	
	// 분류 추가
	@PostMapping(value="/area", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> areaInsert(@RequestBody AreaVO vo) {
		log.info(vo.getWard());
		ResponseEntity<String> entity = null;
		
		try {
			
			categoryservice.insertArea(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping(value="/lkind", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> lkindInsert(@RequestBody L_kindVO vo) {
		
			log.info(vo.getK_group());
			ResponseEntity<String> entity = null;
			
			try {
				
				categoryservice.insertLkind(vo);
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		
		return entity;
	}
	
	@PostMapping(value="/skind", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> skindInsert(@RequestBody S_kindVO vo) {
			log.info("VO에 들어온 값 확인 : " + vo);

			ResponseEntity<String> entity = null;
			
			try {
				
				categoryservice.insertSkind(vo);
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		
		return entity;
	}
	
	// 분류 삭제
	@DeleteMapping("/")
	public String category(Long num) {
		
		return "redirect:list/";
	}
	
}
