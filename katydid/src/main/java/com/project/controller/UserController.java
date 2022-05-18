package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.AuthVO;
import com.project.domain.UserVO;
import com.project.service.user.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwen;
	
	@GetMapping("/admin")
	public void admin() {
		log.info("어드민으로 접속");
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/join")
	public void joinForm() {
		log.info("회원가입창 접속");
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/join")
	public String join(UserVO vo, String[] role) {
		log.info("가입시 받은 데이터들 : " + vo);
		log.info("사용자가 선택한 권한 목록: " + role);
		
		vo.setAuthList(new ArrayList<AuthVO>());
		
		for(int i=0; i < role.length; i++) {
			vo.getAuthList().add(new AuthVO());
			vo.getAuthList().get(i).setAuth(role[i]);
			vo.getAuthList().get(i).setU_id(vo.getU_id());
		}
		log.info(vo.getAuthList());
		String pw = pwen.encode(vo.getUpw());
		vo.setUpw(pw);
		log.info("암호화 후 비밀번호 : " + pw);
		service.insertUser(vo);
		
		return "redirect:/";
	}
	
	@PostMapping(value="/idConfirm",consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> idConfirm(@RequestBody UserVO vo) {
		
		ResponseEntity<String> entity = null;
		
		List<UserVO> userlist = service.selectAllUser(vo);
		log.info(userlist);
		if(userlist.isEmpty()) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
}
