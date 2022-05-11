package com.project.controller;

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

import com.project.domain.CategoryVO;
import com.project.domain.StoreVO;
import com.project.service.category.CategoryService;
import com.project.service.store.StoreService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/enterprise")
public class StoreController {

	@Autowired
	private StoreService storeservice;
	
	// 분류 추가
		@PostMapping(value="store", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> storeInsert(@RequestBody StoreVO vo) {
			log.info(vo.getStno());
			ResponseEntity<String> entity = null;
			
			try {
				
				storeservice.addStore(vo);
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
}
