package com.project.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.UserVO;
import com.project.mapper.user.UserMapper;
import com.project.reply.ReplyMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testRead() {
		
		UserVO vo = mapper.read("zxc");
		
		log.info(vo);
	}
	
}
