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
public class CategoryMapperDeleteTest {

	@Autowired
	private CategoryMapper mapper;
	
	@Test
	public void deleteAreaTest() {
		AreaVO vo = new AreaVO();
		vo.setAno(1L);
		mapper.deleteArea(vo);
	}
	
	@Test
	public void deleteCategoryTest() {
		CategoryVO vo = new CategoryVO();
		vo.setCno(1L);
		mapper.deleteCategory(vo);
	}
	
	@Test
	public void deleteLkindTest() {
		L_kindVO vo = new L_kindVO();
		vo.setLno(1L);
		mapper.deleteLkind(vo);
	}
	
	@Test
	public void deleteSkindTest() {
		S_kindVO vo = new S_kindVO();
		vo.setSno(1L);
		mapper.deleteSkind(vo);
	}
	
}
