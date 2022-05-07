package com.project.mapper.s_kind;

import java.util.List;

import com.project.domain.S_kindVO;

public interface S_kindMapper {

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
