package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.BoardVO;
import com.project.domain.R_reportVO;
import com.project.domain.StoreVO;
import com.project.service.R_report.R_reportService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/R_report")
public class R_reportController {
	
	@Autowired
	private R_reportService service;
	
	
	// 댓글신고 작성
	@PostMapping(value="", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
			public ResponseEntity<String> register
				(@RequestBody R_reportVO vo){
			ResponseEntity<String> entity = null;
			try {
			service.addR_report(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			log.info(vo);
			}catch(Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
			}
			
	
	
}
