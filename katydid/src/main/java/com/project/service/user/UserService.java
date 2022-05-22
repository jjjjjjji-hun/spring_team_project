package com.project.service.user;

import java.util.List;

import com.project.domain.UserVO;

public interface UserService {
	
	public List<UserVO> selectAllUser(UserVO vo);
	
	public void insertUser(UserVO vo);

}
