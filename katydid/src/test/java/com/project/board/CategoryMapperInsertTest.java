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
public class CategoryMapperInsertTest {

	@Autowired
	private CategoryMapper mapper;
	
	@Test
	public void insertAreaTest() {
		AreaVO vo = new AreaVO();
		vo.setWard("강남구");
		mapper.insertArea(vo);
	}
	
	@Test
	public void insertCategoryTest() {
		CategoryVO vo = new CategoryVO();
		vo.setSno(1L);
		vo.setAno(1L);
		mapper.insertCategory(vo);
	}
	
	@Test
	public void insertLkindTest() {
		L_kindVO vo = new L_kindVO();
		vo.setK_group("맛집");
		mapper.insertLkind(vo);
	}
	
	@Test
	public void insertSkindTest() {
		S_kindVO vo = new S_kindVO();
		vo.setLno(1L);
		vo.setSClass("한식");
		mapper.insertSkind(vo);
	}
	
}
