package com.project.board.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String u_id;
	private long hit;
	private Long cno;
	private Long sno;
	private Date regdate;
	private Date updatedate;
	
}
