package com.project.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.board.domain.BoardVO;
import com.project.board.domain.Criteria;
import com.project.board.domain.SearchCriteria;
import com.project.board.mapper.BoardMapper;

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
		
		vo.setCno(1);
		vo.setU_id("id");
		vo.setTitle("1");
		vo.setContent("1");
		vo.setSno(1);
		
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
		vo.setBno(1);
		
		mapper.update(vo);
	}
	
	//@Test
	public void countPageNumTest() {
		//mapper.countPageNum(cri);
	}
	
}
