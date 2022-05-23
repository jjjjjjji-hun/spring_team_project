package com.project.mapper.menu;

import java.util.List;

import com.project.domain.MenuVO;
import com.project.domain.PayVO;

public interface MenuMapper {
	// 메뉴
	// 메뉴 목록 가져오기
	public List<MenuVO> getMenuList(Long stno);
	
	// 메뉴 하나 가져오기
	public MenuVO getMenu(Long mno);
	
	// 메뉴 생성하기
	public void insertMenu(MenuVO vo);
	
	// 메뉴 수정하기
	public void updateMenu(MenuVO vo);
	
	// 메뉴 삭제하기
	public void deleteMenu(Long mno);
	
	// 메뉴 리스트 생성하기
	public void insertMenuList(MenuVO vo);
	
	// 결제 생성하기
	public void insertPay(PayVO vo);
}
