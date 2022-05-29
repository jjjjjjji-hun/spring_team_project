package com.project.controller;

import java.security.Principal;
import java.security.Provider.Service;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.L_kindVO;
import com.project.domain.PageMaker;
import com.project.domain.R_reportVO;
import com.project.domain.SearchCriteria;
import com.project.service.B_report.B_reportService;
import com.project.service.R_report.R_reportService;
import com.project.service.category.CategoryService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping("/B_report")
public class B_reportController {
	

	@Autowired
	private B_reportService service;
	
	@Autowired
	private CategoryService categoryservice;
	
	
	//게시판 신고
	//insert
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@PostMapping(value="", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		@ResponseBody
				public ResponseEntity<String> register
					(@RequestBody B_reportVO vo, Principal principal){
				ResponseEntity<String> entity = null;
				log.info("입력전 : " + vo.getBno());
				log.info(principal.getName());
				vo.setReportId(principal.getName());
			
				
				try {
				service.addB_report(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				log.info(vo);
				}catch(Exception e){
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
				return entity;
	}
		
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@PostMapping("/delete")
		public String BreportDelete(long b_reno) {
			
			service.removeB_report(b_reno);
				
		
			
			return "redirect:B_relist";	
		}
		
		
		
		
		// 게시판 신고 목록 조회
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
		@GetMapping("/B_relist")
		public String getList(SearchCriteria cri, Model model) {
			
			List<B_reportVO> b_reportList = service.getAllB_reportList(cri);
			
			model.addAttribute("b_reportList", b_reportList );
		
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalBoard(service.countPageNum(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			log.info("b_reportList");
			System.out.println("리스트 : " + b_reportList);
			return "B_report/brlist";
			
		}
		
	/*	

		// 게시판 신고 목록 조회(전체)
	@GetMapping(value="/all", produces= {MediaType.APPLICATION_XML_VALUE,
									MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
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
	
	
	@GetMapping(value="/b_reportList",
			produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<B_reportVO>> getb_reportList(){
					ResponseEntity<List<B_reportVO>> entity = null;
					
					try {
						entity = new ResponseEntity<>(service.getAllB_reportList(), HttpStatus.OK);
					}catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}
					return entity;
			}
	
	*/
	
	
		
		// 게시판 신고 1개 받아오기
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@GetMapping(value="/B_Bport/{b_reno}", produces= {MediaType.APPLICATION_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
		@ResponseBody
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
		
		
		
		
		//게시판 신고 디테일
		@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@GetMapping("/list/{b_reno}")
		public String getRreportDetail(@PathVariable long b_reno, Model model) {
			
			model.addAttribute("b_report", service.getReport(b_reno));
			
		
			
			return "B_report/b_reportDetail";
		}			
		
		
	
		
		@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@PostMapping("/updateForm")
		public String b_reportUpdateForm(long b_reno,  Model model) {
			
			B_reportVO b_reportvo = service.getReport(b_reno);
			
			model.addAttribute("b_report", b_reportvo);
			
			
			
			return "B_report/b_reportUpdateForm";
		}
		
		
		@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
		@PostMapping("/update")
		public String b_reportUpdate(B_reportVO vo, Model model) {
			
			service.modifyB_report(vo);
			
		
			
			return "redirect:list/" + vo.getB_reno();
		}
		
		
		
		
		
		  // 게시판 댓글 관리자 체크 업데이트
		@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
		@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
		         value="/checkUpdate/{b_reno}",
		         consumes="application/json",
		         produces= {MediaType.TEXT_PLAIN_VALUE})
       public ResponseEntity<String> modify (
    		   @PathVariable("b_reno") Long b_reno){
    	   
    	   ResponseEntity<String> entity = null;
    	   
    	   try {
    		   B_reportVO vo = new B_reportVO();
    		   vo.setB_reno(b_reno);
    		   
    		   vo.setVerified(1);
    		   log.info("확인할 게시글 신고 번호 : " + b_reno);
    		   
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
