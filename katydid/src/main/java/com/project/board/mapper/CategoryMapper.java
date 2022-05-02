package com.project.board.mapper;

import java.util.List;

import com.project.board.domain.AreaVO;
import com.project.board.domain.CategoryVO;
import com.project.board.domain.L_kindVO;
import com.project.board.domain.S_kindVO;

public interface CategoryMapper {

	public List<AreaVO> getAreaList();
	
	public AreaVO getArea(Long ano);

	public List<CategoryVO> getCategoryList();
	
	public CategoryVO getCategory(Long cno);
	
	public List<L_kindVO> getLkindList();
	
	public L_kindVO getLkind(Long lno);
	
	public List<S_kindVO> getSkindList();
	
	public S_kindVO getSkind(Long sno);
	
	public void insertArea(AreaVO vo);
	
	public void insertCategory(CategoryVO vo);
	
	public void insertLkind(L_kindVO vo);
	
	public void insertSkind(S_kindVO vo);
	
	public void deleteArea(AreaVO vo);
	
	public void deleteCategory(CategoryVO vo);
	
	public void deleteLkind(L_kindVO vo);
	
	public void deleteSkind(S_kindVO vo);
	
	public void updateArea(AreaVO vo);
	
	public void updateCategory(CategoryVO vo);
	
	public void updateLkind(L_kindVO vo);
	
	public void updateSkind(S_kindVO vo);
	
	
}
