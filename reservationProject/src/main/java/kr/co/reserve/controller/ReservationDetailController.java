package kr.co.reserve.controller;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.reserve.service.ReserveService;

@Controller
public class ReservationDetailController {
	
	@Autowired 
	ReserveService reserveService;
	
	
	@RequestMapping("/getRsvDetail/{reserveNo}")
	@ResponseBody
	public String getRsvDetail(@PathVariable int reserveNo) throws JsonProcessingException {

		String result = null;
		String data = null;
		

		HashMap<String , String> map = reserveService.getRsvDetail(reserveNo);
		//HashMap to JSON 문자열 
		ObjectMapper mapper = new ObjectMapper();
		data = mapper.writeValueAsString(map);
		
		result = "{\"result\":\"ok\",\"data\":"+data+"}";
				
		return result;
		
		
	}
	
}