package com.project.mapper.menu;

import java.util.List;

import com.project.domain.MenuVO;

public interface MenuMapper {
	// 메뉴
	// 메뉴 목록 가져오기
	public List<MenuVO> getMenuList();
	
	// 메뉴 하나 가져오기
	public MenuVO getMenu(Long mno);
	
	// 메뉴 생성하기
	public void insertMenu(MenuVO vo);
	
	// 메뉴 수정하기
	public void updateMenu(MenuVO vo);
	
	// 메뉴 삭제하기
	public void deleteMenu(MenuVO vo);
}
