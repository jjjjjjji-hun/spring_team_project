package com.project.controller;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.R_reportVO;
import com.project.service.B_report.B_reportService;
import com.project.service.R_report.R_reportService;

import lombok.extern.log4j.Log4j;


@Log4j
@RestController
@RequestMapping("/B_report")
public class B_reportController {
	

	@Autowired
	private B_reportService service;
	//게시판 신고
	
		@PostMapping(value="", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
				public ResponseEntity<String> register
					(@RequestBody B_reportVO vo){
				ResponseEntity<String> entity = null;
				try {
				service.addB_report(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				log.info(vo);
				}catch(Exception e){
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
				return entity;
				}
		

}
