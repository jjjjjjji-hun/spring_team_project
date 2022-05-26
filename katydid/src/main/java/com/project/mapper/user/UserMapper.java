package com.project.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.UserVO;

public interface UserMapper {
	
	public List<UserVO> allUser();
	
	public List<UserVO> selectAllUser(UserVO vo);
	
	public UserVO read(String u_id);
	
	public void insertUser(UserVO vo);
	
	public void insertUserAuth(UserVO vo);
	
	public void deleteUser(String u_id);
	
}
