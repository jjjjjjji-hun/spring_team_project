package com.project.message;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.MessageVO;
import com.project.mapper.message.MessageMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MessageMapperTest {
	
	@Autowired
	private MessageMapper mapper;
	
	// @Test
	public void sendMessageTest() {
		MessageVO vo = new MessageVO();
		
		vo.setSendId("zxc");
		vo.setReceiveId("asd");
		vo.setContent("쪽지 테스트");
		mapper.sendMessage(vo);
		log.info(vo);
	}
	
	@Test
	public void getBySendIdTest() {
		
		List<MessageVO> vo = mapper.getBySendId("zxc");
		
		log.info(vo);
	}
	
	@Test
	public void getByReceiveId() {
		
		List<MessageVO> vo = mapper.getBySendId("asd");
		
		log.info(vo);
	}

}
