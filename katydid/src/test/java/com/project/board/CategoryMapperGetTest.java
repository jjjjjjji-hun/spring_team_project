package com.project.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.board.domain.AreaVO;
import com.project.board.domain.CategoryVO;
import com.project.board.domain.L_kindVO;
import com.project.board.domain.S_kindVO;
import com.project.board.mapper.CategoryMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CategoryMapperGetTest {

	@Autowired
	private CategoryMapper mapper;
	
	@Test
	public void getAreaTest() {
		AreaVO vo = mapper.getArea(1L);
		log.info(vo);
	}
	
	@Test
	public void getCategoryTest() {
		CategoryVO vo = mapper.getCategory(1L);
		log.info(vo);
	}
	
	@Test
	public void getLkindTest() {
		L_kindVO vo = mapper.getLkind(1L);
		log.info(vo);
	}
	
	@Test
	public void getSkindTest() {
		S_kindVO vo = mapper.getSkind(1L);
		log.info(vo);
	}
	
}
