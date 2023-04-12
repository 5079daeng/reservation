package kr.co.reserve.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Reservation {
	
	private int reserveNo;
	private int roomNo;
	private String checkInDate;
	private String checkOutDate;
	private int userCount;
	private String status;
	private int userNo;
	private String userId;
	

}