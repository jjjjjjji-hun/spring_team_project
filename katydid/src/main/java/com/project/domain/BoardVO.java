package com.project.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String u_id;
	private long hit;
	private Long stno;
	private Date regdate;
	private Date updatedate;
	private int replyCount;
	
	private List<BoardAttachVO> attachList;
}
