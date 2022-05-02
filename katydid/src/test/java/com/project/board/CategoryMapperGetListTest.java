package com.project.board;

import java.util.List;

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
public class CategoryMapperGetListTest {

	@Autowired
	private CategoryMapper mapper;
	
	@Test
	public void getAreaListTest() {
		List<AreaVO> vo = mapper.getAreaList();
		log.info(vo);
	}
	
	@Test
	public void getCategoryListTest() {
		List<CategoryVO> vo = mapper.getCategoryList();
		log.info(vo);
	}
	
	@Test
	public void getLkindListTest() {
		List<L_kindVO> vo = mapper.getLkindList();
		log.info(vo);
	}
	
	@Test
	public void getSkindListTest() {
		List<S_kindVO> vo = mapper.getSkindList();
		log.info(vo);
	}
	
}
