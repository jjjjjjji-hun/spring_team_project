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
public class CategoryMapperDeleteTest {

	@Autowired
	private CategoryMapper categorymapper;
	
	@Autowired
	private AreaMapper areamapper;
	
	@Autowired
	private L_kindMapper l_kindmapper;
	
	@Autowired
	private S_kindMapper s_kindmapper;
	
	@Test
	public void deleteAreaTest() {
		AreaVO vo = new AreaVO();
		vo.setAno(1L);
		areamapper.deleteArea(vo);
	}
	
	@Test
	public void deleteCategoryTest() {
		CategoryVO vo = new CategoryVO();
		vo.setCno(1L);
		categorymapper.deleteCategory(vo);
	}
	
	@Test
	public void deleteLkindTest() {
		L_kindVO vo = new L_kindVO();
		vo.setLno(1L);
		l_kindmapper.deleteLkind(vo);
	}
	
	@Test
	public void deleteSkindTest() {
		S_kindVO vo = new S_kindVO();
		vo.setSno(1L);
		s_kindmapper.deleteSkind(vo);
	}
	
}
