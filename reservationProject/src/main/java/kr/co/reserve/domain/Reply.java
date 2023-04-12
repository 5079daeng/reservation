package kr.co.reserve.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class Reply {
	
	private int ReplyNo ;
	private int boardNo; 
	private int userNo;
	private String content;
	private Date created;
	private Date deleted; 
}