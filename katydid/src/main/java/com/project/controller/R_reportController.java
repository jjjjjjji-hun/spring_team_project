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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.PageMaker;
import com.project.domain.R_reportVO;
import com.project.domain.ReplyVO;
import com.project.domain.SearchCriteria;
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
			
	
	
	
	
	// 댓글 신고글 삭제
		@DeleteMapping(value="{r_reno}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("r_reno") Long r_reno){
			ResponseEntity<String> entity = null;
			try {
				service.removeR_report(r_reno);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		
		
		
		
	/*	// 댓글 신고글 수정
		@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
							value="/{r_reno}",
							consumes="application/json",
							produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> modify(@RequestBody R_reportVO vo, @PathVariable("r_reno") Long r_reno){
			ResponseEntity<String> entity = null;
			try {
				vo.setR_reno(r_reno);
				service.modifyR_report(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		*/
		
		
		
		// 댓글 신고 목록 조회
		@GetMapping(value="/all/", produces= {MediaType.APPLICATION_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<R_reportVO>> list(){
			ResponseEntity<List<R_reportVO>> entity = null;
			try {
				entity = new ResponseEntity<>(service.getAllR_reportList(), HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		
		
		// 댓글 신고 1개 받아오기
		@GetMapping(value="/R_Rport/{r_reno}", produces= {MediaType.APPLICATION_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<R_reportVO> r_report(@PathVariable("r_reno")Long r_reno){
			ResponseEntity<R_reportVO> entity = null;
			try {
				entity = new ResponseEntity<>(service.getReport(r_reno), HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}				
}
