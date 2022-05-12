package com.project.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MenuVO;
import com.project.domain.StoreVO;
import com.project.mapper.menu.MenuMapper;
import com.project.mapper.store.StoreMapper;
import com.project.service.store.StoreServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreMapper storemapper;
	
	@Autowired
	private MenuMapper menumapper;
	
	@Override
	public void addStore(StoreVO vo) {
		storemapper.insertStore(vo);
	}

	@Override
	public List<StoreVO> listStore(Long cno) {
		return storemapper.getStoreList(cno);
	}

	@Override
	public void modifyStore(StoreVO vo) {
		storemapper.updateStore(vo);
		
	}

	@Override
	public void removeStore(Long stno) {
		storemapper.deleteStore(stno);
		
	}

	@Override
	public StoreVO selectStore(Long stno) {
		return storemapper.getStore(stno);
	}
	
	@Override
	public void addMenu(MenuVO vo) {
		menumapper.insertMenu(vo);
		
	}

	@Override
	public List<MenuVO> listMenu(Long stno) {
		return menumapper.getMenuList(stno);
	}

	@Override
	public void modifyMenu(MenuVO vo) {
		menumapper.updateMenu(vo);
		
	}

	@Override
	public void removeMenu(Long mno) {
		menumapper.deleteMenu(mno);
		
	}

	@Override
	public MenuVO selectMenu(Long mno) {
		return menumapper.getMenu(mno);
	}

}
