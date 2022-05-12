package com.project.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.SearchCriteria;
import com.project.domain.StoreVO;
import com.project.mapper.b_report.B_reportMapper;
import com.project.mapper.board.BoardMapper;
import com.project.mapper.category.CategoryMapper;
import com.project.mapper.reply.ReplyMapper;
import com.project.mapper.store.StoreMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardmapper;
	
	@Autowired
	private CategoryMapper categorymapper;
	
	@Autowired
	private ReplyMapper replymapper;
	
	@Autowired
	private B_reportMapper b_reportmapper;
	
	@Autowired
	private StoreMapper storemapper;
	
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

	@Transactional
	@Override
	public void insert(BoardVO vo, StoreVO svo) {
		//storemapper.insertStore(svo);
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
		b_reportmapper.insertReport(vo);
		
	}

	@Override
	public List<B_reportVO> listB_Report(Long bno) {
		
		return b_reportmapper.getRepoerList(bno);
	}

	@Override
	public void modifyB_report(B_reportVO vo) {
		b_reportmapper.updateRepoer(vo);
		
	}

	@Override
	public void removeB_report(Long b_reno) {
		b_reportmapper.deleteReport(b_reno);
		
	}
}
