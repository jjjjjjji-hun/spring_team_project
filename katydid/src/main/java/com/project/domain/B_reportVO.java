package com.project.domain;

import lombok.Data;

@Data
public class B_reportVO {
	
	private Long b_reno;
	private Long bno;
	private String reason;
	private String content;
	private String reportId;
	private String reportedId;
	private int verified;

}
