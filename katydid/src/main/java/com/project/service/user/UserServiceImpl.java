package com.project.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.UserVO;
import com.project.mapper.user.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Transactional
	@Override
	public void insertUser(UserVO vo) {

		mapper.insertUser(vo);
		
		mapper.insertUserAuth(vo);
		
	}

	@Override
	public List<UserVO> selectAllUser(UserVO vo) {
		List<UserVO> userlist = mapper.selectAllUser(vo);
		return userlist;
	}

	@Override
	public void deleteUser(String u_id) {
		mapper.deleteUser(u_id);
		
	}

	@Override
	public List<UserVO> allUser() {
		return mapper.allUser();
	}

}
