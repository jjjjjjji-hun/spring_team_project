package com.project.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.board.domain.B_reportVO;
import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;

public interface BoardMapper {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public void insert(BoardVO vo);
	
	public BoardVO select(long bno);
	
	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	public int countPageNum(SearchCriteria cri);
	
	// 게시글 댓글 개수
	public void updateReplyCount(@Param("bno") Long bno,@Param("amount") int amount);
	
	
	
	//게시판 신고
	// 전제 게시글 신고 내역 가져오기
	public List<B_reportVO> getRepoerList(Long bno);
	
	//게시글 신고 하나 가져오기
	public B_reportVO getReport(Long B_reno);
	
	//게시글 신고하기
	public void insertReport(B_reportVO vo);
	
	//게시글 신고 수정하기
	public void updateRepoer(B_reportVO vo);
	
	//게시글 신고 삭제하기
	public void deleteReport(Long B_reno);
	
	//게시글 번호에 달린신고를 삭제?
	public void deleteAllReport(Long bno);
	
	
	
	
	
	
	
	
	
}
