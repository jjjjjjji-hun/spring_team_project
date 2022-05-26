package com.project.service.user;

import java.util.List;

import com.project.domain.UserVO;

public interface UserService {
	
	public List<UserVO> allUser();
	
	public List<UserVO> selectAllUser(UserVO vo);
	
	public void insertUser(UserVO vo);
	
	public void deleteUser(String u_id);

}
