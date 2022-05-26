package com.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.MessageVO;
import com.project.service.message.MessageService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService service;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@GetMapping(value="/sended", consumes="application/json",
							produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<List<MessageVO>> getBySendId(@RequestBody String u_id) {
		ResponseEntity<List<MessageVO>> entity = null;
		log.info("받은 메세지를 조회할 아이디 : " + u_id);
		try {
			List<MessageVO> messageList = service.getBySendId(u_id);
			entity = new ResponseEntity<List<MessageVO>>(messageList, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<MessageVO>>( HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@GetMapping(value="/received", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<List<MessageVO>> getByReceiveId(@RequestBody String u_id) {
		ResponseEntity<List<MessageVO>> entity = null;
		log.info("보낸 메세지를 조회할 아이디 : " + u_id);
		try {
			List<MessageVO> messageList = service.getByReceiveId(u_id);
			entity = new ResponseEntity<List<MessageVO>>(messageList, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<MessageVO>>( HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@PostMapping(value="/send", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> sendMessage(@RequestBody MessageVO vo, Principal principal) {
		ResponseEntity<String> entity = null;
		vo.setSendId(principal.getName());
		log.info("메세지를 보내는 아이디 : " + vo.getSendId());
		log.info("메세지를 받는 아이디 : " + vo.getReceiveId());
		log.info("보내는 메세지내용 : " + vo.getContent());
		try {
			service.sendMessage(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
