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
		
		model.addAttribute("s_kindList", categoryservice.getSkindList());
		
		return "category/categoryList";
	}
	
	@GetMapping("/")
	public String categoryInsertForm(Model model) {
		model.addAttribute("areaList", categoryservice.getAreaList());
		
		model.addAttribute("l_kindList", categoryservice.getLkindList());
		
		model.addAttribute("s_kindList", categoryservice.getSkindList());
		return "category/categoryForm";
	}
	
	@GetMapping("/test")
	public String categoryTest(Model model) {
		model.addAttribute("areaList", categoryservice.getAreaList());
		
		model.addAttribute("l_kindList", categoryservice.getLkindList());
		
		model.addAttribute("s_kindList", categoryservice.getSkindList());
		
		model.addAttribute("categoryList", categoryservice.getCategoryList());
		return "category/categoryTest";
	}
	
	@GetMapping(value="/tests",
			produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<CategoryVO>> list(){
					ResponseEntity<List<CategoryVO>> entity = null;
					
					try {
						entity = new ResponseEntity<>(categoryservice.getCategoryList(), HttpStatus.OK);
					}catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}
					return entity;
			}
	
	@GetMapping(value="/l_kindList",
			produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<L_kindVO>> getL_kindList(){
					ResponseEntity<List<L_kindVO>> entity = null;
					
					try {
						entity = new ResponseEntity<>(categoryservice.getLkindList(), HttpStatus.OK);
					}catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}
					return entity;
			}
	
	// 카테고리 추가
		@PostMapping(value="/insert", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> categoryInsert(@RequestBody CategoryVO vo) {
			log.info(vo.getAno());
			log.info(vo.getSno());
			ResponseEntity<String> entity = null;
			
			try {
				
				categoryservice.insertCategory(vo);
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				
			} catch(Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
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
	
	// 분류 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/updateArea", consumes="application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify (@RequestBody AreaVO areavo) {
	
		ResponseEntity<String> entity = null;
		
		try {
			log.info("수정 vo : " + areavo);
			categoryservice.updateArea(areavo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
	return entity;
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/updateLkind", consumes="application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify (@RequestBody L_kindVO lkindvo) {
	
		ResponseEntity<String> entity = null;
		
		try {
				log.info("수정 vo : " + lkindvo);
				categoryservice.updateLkind(lkindvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
	return entity;
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/updateSkind", consumes="application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify (@RequestBody S_kindVO skindvo) {
	
		ResponseEntity<String> entity = null;
		
		try {
			log.info("수정 vo : " + skindvo);
			categoryservice.updateSkind(skindvo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
	return entity;
	}
	
}
