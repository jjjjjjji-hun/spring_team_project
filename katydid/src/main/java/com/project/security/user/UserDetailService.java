package com.project.security.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.mapper.user.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class UserDetailService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("유저 이름 확인 : " + username);
		return null;
	}
	

}
