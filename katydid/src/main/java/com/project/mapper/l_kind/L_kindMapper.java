package com.project.mapper.l_kind;

import java.util.List;

import com.project.domain.L_kindVO;

public interface L_kindMapper {

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
}
