package com.project.controller;

import java.security.Provider.Service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.PageMaker;
import com.project.domain.R_reportVO;
import com.project.domain.SearchCriteria;
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
	//insert
		@PostMapping(value="", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
				public ResponseEntity<String> register
					(@RequestBody B_reportVO vo){
				ResponseEntity<String> entity = null;
				log.info("입력전 : " + vo.getBno());
				try {
				service.addB_report(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				log.info(vo);
				}catch(Exception e){
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
				return entity;
				}
		
		
	
		
      
		
		     // 게시판 신고글 삭제
				@DeleteMapping(value="{b_reno}", produces = {MediaType.TEXT_PLAIN_VALUE})
				public ResponseEntity<String> remove(@PathVariable("b_reno") Long b_reno){
					ResponseEntity<String> entity = null;
					try {
						service.removeB_report(b_reno);
						entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
					}catch(Exception e) {
						entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
					}
					return entity;
				}
		
				
				
				// 게시판 신고 글 수정
				@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
									value="/{b_reno}",
									consumes="application/json",
									produces= {MediaType.TEXT_PLAIN_VALUE})
				public ResponseEntity<String> modify(@RequestBody B_reportVO vo, @PathVariable("b_reno") Long b_reno){
					ResponseEntity<String> entity = null;
					try {
						vo.setB_reno(b_reno);
						service.modifyB_report(vo);
						entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
					}catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
					}
					return entity;
				}
				
				
				// 게시판 신고 목록 조회(전체)
				@GetMapping(value="/all", produces= {MediaType.APPLICATION_XML_VALUE,
												MediaType.APPLICATION_JSON_UTF8_VALUE})
				public ResponseEntity<List<B_reportVO>> list(){
					ResponseEntity<List<B_reportVO>> entity = null;
					try {
						entity = new ResponseEntity<>(service.getAllB_reportList(), HttpStatus.OK);
					}catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}
					return entity;
				}				
				
				// 게시판 신고 1개 받아오기
				@GetMapping(value="/B_Bport/{b_reno}", produces= {MediaType.APPLICATION_XML_VALUE,
												MediaType.APPLICATION_JSON_UTF8_VALUE})
				public ResponseEntity<B_reportVO> b_report(@PathVariable("b_reno")Long b_reno){
					ResponseEntity<B_reportVO> entity = null;
					try {
						entity = new ResponseEntity<>(service.getReport(b_reno), HttpStatus.OK);
					}catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}
					return entity;
				}				
	

		
		
}
