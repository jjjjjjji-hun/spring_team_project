package com.project.mapper.store;

import java.util.List;

import com.project.domain.StoreVO;

public interface StoreMapper {
	// 식당
	// 식당 목록 가져오기
	public List<StoreVO> getStoreList(Long cno);
	
	// 식당 하나 가져오기
	public StoreVO getStore(Long stno);
	
	// 식당 생성하기
	public void insertStore(StoreVO vo);
	
	// 식당 수정하기
	public void updateStore(StoreVO vo);
	
	// 식당 삭제하기
	public void deleteStore(Long stno);
}
