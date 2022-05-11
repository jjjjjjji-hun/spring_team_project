package com.project.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.domain.SearchCriteria;
import com.project.mapper.board.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Autowired
	private BoardMapper mapper;
	
	//@Test
	public void getListTest() {
		SearchCriteria cri = new SearchCriteria();
		
		mapper.getList(cri);
	}
	
	//@Test
	public void insertTest() {
		BoardVO vo = new BoardVO();
		
		vo.setU_id("id");
		vo.setTitle("1");
		vo.setContent("1");
		vo.setStno(1L);
		
		mapper.insert(vo);
	}
	
	//@Test
	public void selectTest() {
		mapper.select(1);
	}
	
	//@Test
	public void deleteTest() {
		mapper.delete(1);
	}
	
	//@Test
	public void updateTest() {
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle("1");
		vo.setContent("1");
		vo.setBno(1L);
		
		mapper.update(vo);
	}
	
	//@Test
	public void countPageNumTest() {
		//mapper.countPageNum(cri);
	}
	
}
