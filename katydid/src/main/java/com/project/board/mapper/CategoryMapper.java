package com.project.board.mapper;

import java.util.List;

import com.project.board.domain.AreaVO;
import com.project.board.domain.CategoryVO;
import com.project.board.domain.L_kindVO;
import com.project.board.domain.S_kindVO;

public interface CategoryMapper {

	public List<AreaVO> getAreaList();

	public List<CategoryVO> getCategoryList();
	
	public List<L_kindVO> getLkindList();
	
	public List<S_kindVO> getSkindList();
	
}
