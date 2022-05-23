package com.project.domain;

import lombok.Data;

@Data
public class R_reportVO {

	private Long r_reno;
	private Long rno;
	private String reason;
	private String content;
	private String reportId;
	private String reportedId;
	private int verified;
}
