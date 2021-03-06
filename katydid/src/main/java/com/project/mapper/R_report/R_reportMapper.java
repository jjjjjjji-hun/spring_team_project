package com.project.mapper.R_report;

import java.util.List;

import com.project.domain.B_reportVO;
import com.project.domain.R_reportVO;
import com.project.domain.SearchCriteria;

public interface R_reportMapper {

	// 신고
	// 전체 댓글(후기) 신고 내역 가져오기
	public List<R_reportVO> getReportList(Long rno);
	
	// 댓글(후기) 하나 가져오기
	public R_reportVO getReport(Long rno);
	
	
	//댓글신고한 신고번호, 신고자 받아오기
	public R_reportVO getR_report(Long r_reno);
	
	// 댓글(후기) 신고하기
	public void insertReport(R_reportVO vo);
	
	// 댓글(후기) 신고 수정하기
	public void modifyR_report(R_reportVO vo);
	
	// 댓글(후기) 신고 삭제하기
	public void deleteReport(Long r_reno);
	
	// 댓글 번호에 달린 신고를 삭제
	public void deleteAllReport(Long rno);
	
	//신고리스트 가져오기
	public List<R_reportVO> getAllR_reportList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	//관리자 체크 업데이트
			public void checkUpdate(R_reportVO vo);
			
	// 신고한 사람으로 신고리스트 가져오기
	public List<B_reportVO> getByu_id(String u_id);
					
	
			
	
	
}
