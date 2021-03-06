package com.project.reply;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.ReplyVO;
import com.project.mapper.board.BoardMapper;
import com.project.mapper.reply.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardmapper;
	
	//@Test
	public void insertReplyTest() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(6L);
		vo.setReply("후기쓴다");
		vo.setReplyer("김자바");
		mapper.create(vo);
	}
	
	@Test
	public void update() {
		
		boardmapper.updateReplyCount(8L, 1);
	}
}
