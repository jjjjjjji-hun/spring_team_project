package com.project.mapper.user;

import java.util.List;

import com.project.domain.UserVO;

public interface UserMapper {
	
	public List<UserVO> selectAllUser(UserVO vo);
	
	public UserVO read(String u_id);
	
	public void insertUser(UserVO vo);
	
	public void insertUserAuth(UserVO vo);
	
	// public void resetDate(String u_id);

	// public void resetBanned(String u_id);
	
}
