package com.project.security.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.domain.UserVO;
import com.project.mapper.user.UserMapper;
import com.project.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class UserDetailService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("유저 이름 확인 : " + username);
		
		UserVO vo = mapper.read(username);
		
		log.info("확인된 유저 이름으로 얻어온 정보 : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	

}
