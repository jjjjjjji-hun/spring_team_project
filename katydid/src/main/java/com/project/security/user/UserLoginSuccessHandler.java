package com.project.security.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.project.domain.CustomUser;
import com.project.mapper.user.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.warn("로그인 성공");
		List<String> roleList = new ArrayList<>();
		
		for (GrantedAuthority role : authentication.getAuthorities()) {
			roleList.add(role.getAuthority());
		}
		
		log.warn("부여받은 권한들 : " + roleList);
		if(roleList.contains("ROLE_ADMIN")) {
			response.sendRedirect("/user/admin");
			return;
		}
		
		response.sendRedirect("/");
	}

}
