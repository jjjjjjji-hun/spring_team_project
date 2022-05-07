package com.project.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.AreaVO;
import com.project.domain.CategoryVO;
import com.project.domain.L_kindVO;
import com.project.domain.S_kindVO;
import com.project.mapper.area.AreaMapper;
import com.project.mapper.category.CategoryMapper;
import com.project.mapper.l_kind.L_kindMapper;
import com.project.mapper.s_kind.S_kindMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CategoryMapperGetTest {

	@Autowired
	private CategoryMapper categorymapper;
	
	@Autowired
	private AreaMapper areamapper;
	
	@Autowired
	private L_kindMapper l_kindmapper;
	
	@Autowired
	private S_kindMapper s_kindmapper;
	
	@Test
	public void getAreaTest() {
		AreaVO vo = areamapper.getArea(1L);
		log.info(vo);
	}
	
	@Test
	public void getCategoryTest() {
		CategoryVO vo = categorymapper.getCategory(1L);
		log.info(vo);
	}
	
	@Test
	public void getLkindTest() {
		L_kindVO vo = l_kindmapper.getLkind(1L);
		log.info(vo);
	}
	
	@Test
	public void getSkindTest() {
		S_kindVO vo = s_kindmapper.getSkind(1L);
		log.info(vo);
	}
	
}
