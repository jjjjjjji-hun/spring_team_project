package com.project.mapper.category;

import java.util.List;

import com.project.domain.CategoryVO;

public interface CategoryMapper {	
	// 카테고리
	// 카테고리 목록 가져오기
	public List<CategoryVO> getCategoryList();
	
	// 카테고리 하나 가져오기
	public CategoryVO getCategory(Long cno);
	
	// 카테고리 생성하기
	public void insertCategory(CategoryVO vo);
	
	// 카테고리 수정하기
	public void updateCategory(CategoryVO vo);
	
	// 카테고리 삭제하기
	public void deleteCategory(CategoryVO vo);
		
}
