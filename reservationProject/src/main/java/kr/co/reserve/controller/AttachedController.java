package kr.co.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.reserve.domain.Attached;
import kr.co.reserve.service.AttachedService;

@Controller
public class AttachedController {

	@Autowired(required=false)
	AttachedService service;

	@RequestMapping("/getFiles/{roomNo}")
	@ResponseBody
	public String getFileList(@PathVariable("roomNo") int roomNo) throws JsonProcessingException {
		String result = null, data = null;
		List<Attached> list = service.getFiles(roomNo);

		ObjectMapper mapper = new ObjectMapper();
		data = mapper.writeValueAsString(list);

		result = "{\"result\":\"ok\",\"data\":" + data + "}";

		return result;
	}

}
