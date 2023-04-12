package kr.co.reserve.domain;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Repository
public class Attached {
	private int fileNo;
	private String realTitle;
	private String codeTitle;
	private String category;
	private int cateNo;
}