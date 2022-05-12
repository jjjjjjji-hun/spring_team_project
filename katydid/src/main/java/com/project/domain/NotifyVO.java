package com.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NotifyVO {
	
	private Long nno;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	

}
