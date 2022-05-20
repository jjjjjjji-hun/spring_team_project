package com.project.domain;

import lombok.Data;

@Data
public class MessageVO {

	private Long meno;
	private String sendId;
	private String receiveId;
	private String content;
	
}
