package com.project.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.B_reportVO;
import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.SearchCriteria;
import com.project.domain.StoreVO;
import com.project.mapper.b_report.B_reportMapper;
import com.project.mapper.board.BoardMapper;
import com.project.mapper.boardAttach.BoardAttachMapper;
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
	private BoardAttachMapper attachmapper;
	
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
	public void insert(BoardVO vo) {
		//storemapper.insertStore(svo);
		boardmapper.insert(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size()<=0) {
			return;
		}
		
		vo.getAttachList().forEach(attach -> {
			attach.setBno(vo.getBno());
			attachmapper.insert(attach);
		});
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

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachmapper.findByBno(bno);
	}
   
	
	
}
