package com.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.domain.B_reportVO;
import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;
import com.project.board.mapper.BoardMapper;
import com.project.board.mapper.CategoryMapper;
import com.project.reply.mapper.ReplyMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardmapper;
	
	@Autowired
	private CategoryMapper categorymapper;
	
	@Autowired
	private ReplyMapper replymapper;
	
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

	@Transactional
	@Override
	public void delete(long bno) {
		replymapper.deleteAllReplies(bno);
		boardmapper.delete(bno);
	}

	@Override
	public void update(BoardVO vo) {
		boardmapper.update(vo);
	}
   
	
	//게시판 신고

	@Override
	public void addB_report(B_reportVO vo) {
		boardmapper.insertReport(vo);
		
	}

	@Override
	public List<B_reportVO> listB_Report(Long bno) {
		
		return boardmapper.getRepoerList(bno);
	}

	@Override
	public void modifyB_report(B_reportVO vo) {
		boardmapper.updateRepoer(vo);
		
	}

	@Override
	public void removeB_report(Long b_reno) {
		boardmapper.deleteReport(b_reno);
		
	}
}
