package kr.co.reserve.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.reserve.domain.Attached;
import kr.co.reserve.domain.Room;
import kr.co.reserve.service.AttachedService;
import kr.co.reserve.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	RoomService service;

	@Autowired(required=false)
	AttachedService attahchedservice;

	@RequestMapping("room/list")
	public ModelAndView getRoomList(@RequestParam("checkInDate") String checkInDate,
			@RequestParam("checkOutDate") String checkOutDate, @RequestParam("adult") int adult,
			@RequestParam("child") int child, @RequestParam("max") int max, ModelAndView mav, Room room) {

		List<Room> list = null;
		list = service.getRoomList(checkInDate, checkOutDate, max);

		for (int i = 0; i < list.size(); i++) {
			int roomNo = list.get(i).getRoomNo(); 
		    List<Attached> fileList = attahchedservice.getFiles(roomNo);
		    list.get(i).setImg(fileList);
		}
		mav.addObject("list", list);
		mav.setViewName("roomList");
		return mav;
	}

	@RequestMapping("reserve")
	public ModelAndView doReserve(@RequestParam("checkInDate") String checkInDate,
			@RequestParam("checkOutDate") String checkOutDate, @RequestParam("adult") int adult,
			@RequestParam("child") int child, @RequestParam("max") int max, @RequestParam("roomNo") int roomNo,
			ModelAndView mav) {
		Room room = service.getRoomInfo(roomNo);
		List<Attached> fileList = attahchedservice.getFiles(roomNo);
	    room.setImg(fileList);
		int adultMax = adult;
		int childMax = child;
		mav.addObject("checkInDate", checkInDate);
		mav.addObject("checkOutDate", checkOutDate);
		mav.addObject("adultMax", adultMax);
		mav.addObject("childMax", childMax);
		mav.addObject("Room", room);
		mav.setViewName("reservation");

		return mav;

	}

	@RequestMapping("/getFile/{fileNo}")
	public ResponseEntity<Resource> getFile(@PathVariable("fileNo") int fileNo) {

		Attached file = attahchedservice.getFile(fileNo);
		String fileName = file.getCodeTitle();
		// 업로드된 파일의 경로
		 String path = "/var/lib/tomcat9/webapps/files/";
		//String path = "C:\\Users\\bdahm\\Desktop\\stswork\\files\\";

		Resource resource = new FileSystemResource(path + fileName);

		HttpHeaders header = new HttpHeaders();
		Path filePath = null;

		try {
			filePath = Paths.get(path + fileName); // file의 경로를 구한다
			header.add("Content-Type", Files.probeContentType(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);

	}
	
	
	
	@RequestMapping("/getRoom/{roomNo}")
	@ResponseBody
	public String getRoomData(@PathVariable("roomNo") int roomNo) throws JsonProcessingException {
		String result = null;
		Room room = service.getRoomInfo(roomNo);
		List<Attached> fileList = attahchedservice.getFiles(roomNo);
	    room.setImg(fileList);
		ObjectMapper mapper = new ObjectMapper();
		String data =  mapper.writeValueAsString(room);
		
		result = "{\"result\":\"ok\",\"data\":"+data+"}";
		return result;
		
	}

}