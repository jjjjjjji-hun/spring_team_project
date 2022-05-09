package com.project.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class Users extends User {

	private static final long serialVersionUID = 1L;
	
	private UserVO user;
	
	public Users(String username, String password, Collection<? extends GrantedAuthority> auth) {
		super(username, password, auth);
	}
	
	public Users(UserVO vo) {
		super(vo.getU_id(), vo.getUpw(), vo.getAuthList().stream().map(
				author -> new SimpleGrantedAuthority(author.getAuth())).collect(Collectors.toList()));
		this.user = vo;
	}

}
