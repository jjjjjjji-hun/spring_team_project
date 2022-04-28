package com.project.board.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private long bno;
	private String title;
	private String content;
	private String u_id;
	private long hit;
	private long cno;
	private long sno;
	private Date regdate;
	private Date updatedate;
	
}
