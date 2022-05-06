package com.project.service.store;

import java.util.List;

import com.project.domain.MenuVO;
import com.project.domain.StoreVO;

public interface StoreService {
	// 식당
	public void addStore(StoreVO vo);
	
	public List<StoreVO> listStore(Long stno);
	
	public void modifyStore(StoreVO vo);
	
	public void removeStore(Long stno);
	

	// 메뉴
	public void addMenu(MenuVO vo);
	
	public List<MenuVO> listMenu(Long stno);
	
	public void modifyMenu(MenuVO vo);
	
	public void removeMenu(Long mno);
}
