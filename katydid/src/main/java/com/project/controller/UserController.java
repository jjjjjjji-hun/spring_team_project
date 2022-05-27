package com.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.AuthVO;
import com.project.domain.CustomUser;
import com.project.domain.ReplyVO;
import com.project.domain.UserVO;
import com.project.service.B_report.B_reportService;
import com.project.service.R_report.R_reportService;
import com.project.service.message.MessageService;
import com.project.service.user.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private MessageService messageservice;
	
	@Autowired
	private B_reportService breportservice;
	
	@Autowired
	private R_reportService rreportservice;
	
	@Autowired
	private PasswordEncoder pwen;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
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
	
	@PreAuthorize("permitAll")
	@PostMapping(value="/idConfirm",consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> idConfirm(@RequestBody UserVO vo) {
		
		
		
		ResponseEntity<String> entity = null;
		
		log.info("확인할 아이디 : " + vo.getU_id());
		
		List<UserVO> userlist = service.selectAllUser(vo);
		
		log.info(userlist);
		
		if(userlist.isEmpty()) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@GetMapping("/message")
	public void messageCheck(Model model, Principal principal) {
		
		model.addAttribute("sendMessage", messageservice.getBySendId(principal.getName()));
		model.addAttribute("receivedMessage", messageservice.getByReceiveId(principal.getName()));
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@GetMapping("/")
	public String userPage() {
		return "/user/mypage";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@PostMapping("/delete")
	public String userDelete(Principal principal) {
		
		service.deleteUser(principal.getName());
		
		return "redirect:/";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@GetMapping("/report")
	public void getReportList(Principal principal, Model model) {
		
		model.addAttribute("b_reportList", breportservice.getByu_id(principal.getName()));
		model.addAttribute("r_reportList", rreportservice.getByu_id(principal.getName()));
		
	}
	
}
