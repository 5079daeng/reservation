package kr.co.reserve.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;



@Getter
@Setter
public class Board {
	
	private int boardNo;
	private String title ;
	private String category;
	private String content;
	private int userNo;
	private String userId;
	private Date created;
	private String reply;
	
}