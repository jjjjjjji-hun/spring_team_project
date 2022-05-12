package com.project.mapper.user;

import com.project.domain.UserVO;

public interface UserMapper {
	
	public UserVO read(String u_id);
	
	public void insertUser(UserVO vo);
	
	public void insertUserAuth(UserVO vo);

}
