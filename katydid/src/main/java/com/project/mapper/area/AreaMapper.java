package com.project.mapper.area;

import java.util.List;

import com.project.domain.AreaVO;

public interface AreaMapper {
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
}
