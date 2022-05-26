package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.CategoryVO;
import com.project.domain.MenuVO;
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
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
		@PostMapping(value="storeinsert", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> storeInsert(@RequestBody StoreVO vo) {
	
			ResponseEntity<String> entity = null;
			
			try {
				
				storeservice.addStore(vo);
				log.info(vo.getStno());
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
		@PostMapping(value="menuinsert", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> menuInsert(@RequestBody MenuVO vo) {
	
			ResponseEntity<String> entity = null;
			
			try {
				
				storeservice.addMenu(vo);
				log.info(vo.getMno());
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
		@GetMapping(value="/tests/{cno}",
				produces = {MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE})
			public ResponseEntity<List<StoreVO>> list(@PathVariable("cno") Long cno){
						ResponseEntity<List<StoreVO>> entity = null;
						
						try {
							entity = new ResponseEntity<>(storeservice.listStore(cno), HttpStatus.OK);
						}catch(Exception e) {
							e.printStackTrace();
							entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
						}
						return entity;
				}
}
