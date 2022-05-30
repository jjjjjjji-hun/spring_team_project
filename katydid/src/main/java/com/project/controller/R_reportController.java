package com.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.NotifyVO;
import com.project.domain.PageMaker;
import com.project.domain.R_reportVO;
import com.project.domain.ReplyVO;
import com.project.domain.SearchCriteria;
import com.project.domain.StoreVO;
import com.project.service.Notify.NotifyService;
import com.project.service.R_report.R_reportService;
import com.project.service.board.BoardService;
import com.project.service.category.CategoryService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/R_report")
public class R_reportController {
	
	@Autowired
	private R_reportService service;
	
	@Autowired
	private BoardService boardservice;

	@Autowired
	private NotifyService notifyservice;
	
	@Autowired
	private CategoryService categoryservice;
	
/*	
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
			*/
			
	//댓글신고 작성 신고
		//insert
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
			@PostMapping(value="", consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
			@ResponseBody
					public ResponseEntity<String> register
						(@RequestBody R_reportVO vo,Principal principal,Long r_reno){
					ResponseEntity<String> entity = null;
					log.info("입력전 : " + vo.getRno());
					log.info(vo);
					log.info(principal.getName());
					vo.setReportId(principal.getName()); 
					
					try {
					service.addR_report(vo);
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
					log.info(vo);
					}catch(Exception e){
					entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
					}
					return entity;
					}
			
	
	
	/*
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
		
		*/
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
			@PostMapping("/delete")
			public String RreportDelete(long r_reno) {
				
				service.removeR_report(r_reno);
					
			
				
				return "redirect:R_relist";	
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
		
		
	/*	
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
		*/
		
		
		// 댓글 신고 목록 조회
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
		@GetMapping("/R_relist")
		public String getList(SearchCriteria cri, Model model) {
		
		List<NotifyVO> vo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", vo);
			
			List<R_reportVO> r_reportList = service.getAllR_reportList(cri);
			
			model.addAttribute("r_reportList", r_reportList );
		
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalBoard(service.countPageNum(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			log.info("R_reportList");
			System.out.println("리스트 : " + r_reportList);
			
			return "R_report/rrlist";
			
		}
		
		
		// 댓글 신고 1개 받아오기
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
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
		
		//댓글 신고 디테일
		@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@GetMapping("/list/{r_reno}")
		public String getRreportDetail(@PathVariable long r_reno, Model model) {
			
			List<NotifyVO> vo = notifyservice.getRecentList();
			
			model.addAttribute("recentNotifyList", vo);
			
			model.addAttribute("r_report", service.getReport(r_reno));
			
		
			
			return "R_report/r_reportDetail";
		}
		
		
		@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@PostMapping("/updateForm")
		public String r_reportUpdateForm(long r_reno,  Model model) {
			
			List<NotifyVO> vo = notifyservice.getRecentList();
			
			model.addAttribute("recentNotifyList", vo);
			
			R_reportVO r_reportvo = service.getReport(r_reno);
			
			model.addAttribute("r_report", r_reportvo);
			
			
			
			return "R_report/r_reportUpdateForm";
		}
		
		@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@PostMapping("/update")
		public String r_reportUpdate(R_reportVO vo, Model model) {
			
			service.modifyR_report(vo);
			List<NotifyVO> notifyvo = notifyservice.getRecentList();
			
			model.addAttribute("recentNotifyList", notifyvo);
		
			
			return "redirect:list/" + vo.getR_reno();
		}
		

		  // 게시판 댓글 관리자 체크 업데이트
		@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
		@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
		         value="/checkUpdate/{r_reno}",
		         consumes="application/json",
		         produces= {MediaType.TEXT_PLAIN_VALUE})
     public ResponseEntity<String> modify (
  		   @PathVariable("r_reno") Long r_reno){
  	   
  	   ResponseEntity<String> entity = null;
  	   
  	   try {
  		   R_reportVO vo = new R_reportVO();
  		   vo.setR_reno(r_reno);
  		   
  		   vo.setVerified(1);
  		   log.info("확인할 게시글 신고 번호 : " + r_reno);
  		   
  		   service.checkUpdate(vo);
  		   entity = new ResponseEntity<String>(
  				   "SUCCESS",HttpStatus.OK);
  	   }catch (Exception e) {
  		  
  		   e.printStackTrace();
  		   entity = new ResponseEntity<String>(
  				   e.getMessage(), HttpStatus.BAD_REQUEST);
  				   
  				   
  	   }
  	   return entity;
  	   
     }
     
		
		
		
}
