package com.project.board.domain;

import lombok.Data;

@Data
public class PageMaker {

	private int totalBoard;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum;
	private SearchCriteria cri;
	public void calcData() {
		this.displayPageNum=10;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)displayPageNum) * displayPageNum);
		
		this.startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalBoard / (double)cri.getNumber()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		this.prev = startPage == 1 ? false : true;
		
		this.next = endPage * cri.getNumber() >= totalBoard ? false : true;
		
	}
	
	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
		calcData();
	}
	
}
