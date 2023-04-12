package kr.co.reserve.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.reserve.domain.Reservation;

@Service
public interface ReserveService  { 
	
    int insertReserveData(Reservation rsv); 
    int insertReserveDetailData(int reserveNo,int adult, int child, int adultBf, int childBf, int price);
	int getLastReserveNo();
	List<Reservation> getMyRsvList(int memberNo);
	HashMap<String,String>  getRsvDetail(int reserveNo);
	List<Reservation> getChartData();
	int modify(Reservation rsv); 

}
