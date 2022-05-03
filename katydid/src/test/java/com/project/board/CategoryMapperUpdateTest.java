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
public class CategoryMapperUpdateTest {

	@Autowired
	private CategoryMapper mapper;
	
	@Test
	public void updateAreaTest() {
		AreaVO vo = new AreaVO();
		vo.setAno(1L);
		vo.setWard("강남구");
		mapper.updateArea(vo);
	}
	
	@Test
	public void updateCategoryTest() {
		CategoryVO vo = new CategoryVO();
		vo.setCno(1L);
		vo.setAno(1L);
		vo.setSno(1L);
		mapper.updateCategory(vo);
	}
	
	@Test
	public void updateLkindTest() {
		L_kindVO vo = new L_kindVO();
		vo.setLno(1L);
		vo.setK_group("맛집");
		mapper.updateLkind(vo);
	}
	
	@Test
	public void updateSkindTest() {
		S_kindVO vo = new S_kindVO();
		vo.setSno(1L);
		vo.setSClass("한식");
		vo.setLno(1L);
		mapper.updateSkind(vo);
	}
	
}
