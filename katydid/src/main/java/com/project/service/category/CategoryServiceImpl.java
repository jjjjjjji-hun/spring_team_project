package com.project.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AreaVO;
import com.project.domain.CategoryVO;
import com.project.domain.L_kindVO;
import com.project.domain.S_kindVO;
import com.project.mapper.area.AreaMapper;
import com.project.mapper.category.CategoryMapper;
import com.project.mapper.l_kind.L_kindMapper;
import com.project.mapper.s_kind.S_kindMapper;
import com.project.service.reply.ReplyServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private AreaMapper areamapper;
	
	@Autowired
	private L_kindMapper lkindmapper;
	
	@Autowired
	private S_kindMapper skindmapper;
	
	@Autowired
	private CategoryMapper categorymapper;

	// 지역
	@Override
	public List<AreaVO> getAreaList() {
		return areamapper.getAreaList();
	}

	@Override
	public AreaVO getArea(Long ano) {
		return areamapper.getArea(ano);
	}

	@Override
	public void insertArea(AreaVO vo) {
		areamapper.insertArea(vo);
		
	}

	@Override
	public void updateArea(AreaVO vo) {
		areamapper.updateArea(vo);
	}

	@Override
	public void deleteArea(AreaVO vo) {
		areamapper.deleteArea(vo);
	}

	// 대분류
	@Override
	public List<L_kindVO> getLkindList() {
		return lkindmapper.getLkindList();
	}

	@Override
	public L_kindVO getLkind(Long lno) {
		return lkindmapper.getLkind(lno);
	}

	@Override
	public void insertLkind(L_kindVO vo) {
		lkindmapper.insertLkind(vo);
	}

	@Override
	public void updateLkind(L_kindVO vo) {
		lkindmapper.updateLkind(vo);
	}

	@Override
	public void deleteLkind(L_kindVO vo) {
		lkindmapper.deleteLkind(vo);
	}

	// 소분류
	@Override
	public List<S_kindVO> getSkindList() {
		return skindmapper.getSkindList();
	}

	@Override
	public S_kindVO getSkind(Long sno) {
		return skindmapper.getSkind(sno);
	}

	@Override
	public void insertSkind(S_kindVO vo) {
		skindmapper.insertSkind(vo);
	}

	@Override
	public void updateSkind(S_kindVO vo) {
		skindmapper.updateSkind(vo);
	}

	@Override
	public void deleteSkind(S_kindVO vo) {
		skindmapper.deleteSkind(vo);
	}

	// 카테고리
	@Override
	public List<CategoryVO> getCategoryList() {
		return categorymapper.getCategoryList();
	}

	@Override
	public CategoryVO getCategory(Long cno) {
		return categorymapper.getCategory(cno);
	}

	@Override
	public void insertCategory(CategoryVO vo) {
		categorymapper.insertCategory(vo);
		
	}

	@Override
	public void updateCategory(CategoryVO vo) {
		categorymapper.updateCategory(vo);
		
	}

	@Override
	public void deleteCategory(CategoryVO vo) {
		categorymapper.deleteCategory(vo);
		
	}
	
	
	
}
