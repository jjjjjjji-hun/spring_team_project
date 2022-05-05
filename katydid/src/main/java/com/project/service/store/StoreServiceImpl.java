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
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<StoreVO> listStore(Long stno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyStore(StoreVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeStore(Long stno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addMenu(MenuVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MenuVO> listMenu(Long stno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyMenu(MenuVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeMenu(Long mno) {
		// TODO Auto-generated method stub
		
	}

}
