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
public class CategoryMapperInsertTest {

	@Autowired
	private CategoryMapper categorymapper;
	
	@Autowired
	private AreaMapper areamapper;
	
	@Autowired
	private L_kindMapper l_kindmapper;
	
	@Autowired
	private S_kindMapper s_kindmapper;
	
	@Test
	public void insertAreaTest() {
		AreaVO vo = new AreaVO();
		vo.setWard("신촌");
		areamapper.insertArea(vo);
	}
	
	@Test
	public void insertCategoryTest() {
		CategoryVO vo = new CategoryVO();
		vo.getC_class();
		vo.setWard("노원");
		categorymapper.insertCategory(vo);
	}
	
	@Test
	public void insertLkindTest() {
		L_kindVO vo = new L_kindVO();
		vo.setK_group("맛집");
		l_kindmapper.insertLkind(vo);
	}
	
	@Test
	public void insertSkindTest() {
		S_kindVO vo = new S_kindVO();
		vo.setK_group("맛집");
		vo.setS_class("김밥천국");
		s_kindmapper.insertSkind(vo);
	}
	
}
