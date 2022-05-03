package com.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;
import com.project.board.mapper.BoardMapper;
import com.project.board.mapper.CategoryMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardmapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public List<BoardVO> getList(SearchCriteria cri) {
		return boardmapper.getList(cri);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return boardmapper.countPageNum(cri);
	}

	@Override
	public BoardVO select(long bno) {
		return boardmapper.select(bno);
	}

	@Override
	public void insert(BoardVO vo) {
		boardmapper.insert(vo);
	}

	@Override
	public void delete(long bno) {
		boardmapper.delete(bno);
	}

	@Override
	public void update(BoardVO vo) {
		boardmapper.update(vo);
	}

}
