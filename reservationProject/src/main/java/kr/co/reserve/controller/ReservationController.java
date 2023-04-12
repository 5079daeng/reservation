package kr.co.reserve.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.reserve.domain.Reservation;
import kr.co.reserve.service.ReserveService;


@Controller
public class ReservationController {

	@Autowired
	ReserveService service;

	@RequestMapping(value="/doReserve", method=RequestMethod.POST)
	@ResponseBody
	public String doReserve(@RequestBody String requestBody, Reservation rsv) {
		String result = null;
		int roomNo = 0, userCount = 0, userNo = 0, adult = 0, child = 0, childBf = 0, adultBf = 0, price = 0,
				check = 0, reserveNo = 0;
		String checkInDate = null, checkOutDate = null , userId = null;

		JSONObject json = new JSONObject(requestBody);

		roomNo = json.getInt("roomNo");
		userCount = json.getInt("userCount");
		userNo = json.getInt("userNo");
		userId = json.getString("userId");
		adult = json.getInt("adult");
		child = json.getInt("child");
		childBf = json.getInt("childBf");
		adultBf = json.getInt("adultBf");
		price = json.getInt("price");
		checkInDate = json.getString("checkInDate");
		checkOutDate = json.getString("checkOutDate");

		// 예약 데이터 설정
		rsv.setRoomNo(roomNo);
		rsv.setCheckInDate(checkInDate);
		rsv.setCheckOutDate(checkOutDate);
		rsv.setCheckOutDate(checkOutDate);
		rsv.setUserCount(userCount);
		rsv.setUserNo(userNo);
		rsv.setUserId(userId);

		check = service.insertReserveData(rsv);
		if (check == 0) {
			result = "{\"result\":\"failure\",\"msg\":\"ReserveData error\"}";
		} else {

			reserveNo = service.getLastReserveNo();
			if (reserveNo != 0) {
				check = service.insertReserveDetailData(reserveNo, adult, child, adultBf, childBf, price);
				if (check == 0) {
					result = "{\"result\":\"failure\",\"msg\":\"ReserveData error\"}";
				} else {
					result = "{\"result\":\"success\"}";
				}
			} else {
				result = "{\"result\":\"failure\",\"msg\":\"getLastReserveNo error\"}";
			}

		}

		return result;

	}
	
	
	
	@RequestMapping("/reservation/modify") 
	@ResponseBody
	public String rsvModify(@RequestBody Reservation rsv) {
		String result = null; 
		int cnt = 0; 
		cnt = service.modify(rsv); 
		
		if(cnt >0 ) {
			result = "{\"result\":\"ok\"}";
		} else {
			result = "{\"result\":\"failure\"}";
		}
		return result;
	}

}