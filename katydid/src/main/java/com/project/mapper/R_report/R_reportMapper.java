package com.project.mapper.R_report;

import java.util.List;

import com.project.domain.R_reportVO;

public interface R_reportMapper {

	// 신고
	// 전체 댓글(후기) 신고 내역 가져오기
	public List<R_reportVO> getReportList(Long rno);
	
	// 댓글(후기) 하나 가져오기
	public R_reportVO getReport(Long r_reno);
	
	// 댓글(후기) 신고하기
	public void insertReport(R_reportVO vo);
	
	// 댓글(후기) 신고 수정하기
	public void modifyR_report(R_reportVO vo);
	
	// 댓글(후기) 신고 삭제하기
	public void deleteReport(Long r_reno);
	
	// 댓글 번호에 달린 신고를 삭제
	public void deleteAllReport(Long rno);
	
	//신고리스트 가져오기
	public List<R_reportVO> getAllR_reportList();
	
	
}
