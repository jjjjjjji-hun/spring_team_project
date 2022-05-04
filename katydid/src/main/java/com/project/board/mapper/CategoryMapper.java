package com.project.board.mapper;

import java.util.List;

import com.project.board.domain.AreaVO;
import com.project.board.domain.CategoryVO;
import com.project.board.domain.L_kindVO;
import com.project.board.domain.S_kindVO;

public interface CategoryMapper {
	// 지역
	// 지역 목록 가져오기
	public List<AreaVO> getAreaList();
	
	// 지역 하나 가져오기
	public AreaVO getArea(Long ano);

	// 지역 추가하기
	public void insertArea(AreaVO vo);
	
	// 지역 수정하기
	public void updateArea(AreaVO vo);
	
	// 지역 삭제하기
	public void deleteArea(AreaVO vo);
	
	
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
		
		
	// 대분류
	// 대분류 목록 가져오기
	public List<L_kindVO> getLkindList();
	
	// 대분류 하나 가져오기
	public L_kindVO getLkind(Long lno);
	
	// 대분류 생성하기
	public void insertLkind(L_kindVO vo);
	
	// 대분류 수정하기
	public void updateLkind(L_kindVO vo);
	
	// 대분류 삭제하기
	public void deleteLkind(L_kindVO vo);

	
	// 소분류
	// 소분류 목록 가져오기
	public List<S_kindVO> getSkindList();
	
	// 소분류 하나 가져오기
	public S_kindVO getSkind(Long sno);
	
	// 소분류 생성하기
	public void insertSkind(S_kindVO vo);
	
	// 소분류 수정하기
	public void updateSkind(S_kindVO vo);
	
	// 소분류 삭제하기
	public void deleteSkind(S_kindVO vo);
}
