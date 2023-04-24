package kr.co.reserve.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.reserve.domain.Attached;
import kr.co.reserve.domain.Reservation;
import kr.co.reserve.domain.Room;
import kr.co.reserve.domain.User;
import kr.co.reserve.mapper.RoomMapper;
import kr.co.reserve.service.AttachedService;
import kr.co.reserve.service.ReserveService;
import kr.co.reserve.service.RoomService;
import kr.co.reserve.service.UserService;

@Controller
public class MasterController {

	@Autowired
	RoomService roomService;

	@Autowired
	ReserveService reserveService;

	@Autowired
	AttachedService attachedService;

	@Autowired
	UserService userSevice;

	@RequestMapping("/admin")
	public ModelAndView getAdmin(ModelAndView mav) {
		Date date = new Date();
		List<Reservation> roomList = reserveService.getChartData();
		mav.addObject("roomList", roomList);
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/roomAdmin")
	public ModelAndView getRoomAdmin(ModelAndView mav) {
		List<Room> list = roomService.getTotalRoomList();
		mav.addObject("list", list);
		mav.setViewName("roomAdmin");
		return mav;

	}

	@RequestMapping("/userAdmin")
	public ModelAndView getUser(ModelAndView mav) {

		List<User> list = userSevice.getUserList();
		mav.addObject("userList", list);
		mav.setViewName("userAdmin");
		return mav;
	}

	@RequestMapping("/room/insert")
	public ModelAndView upload2(Room room, @Nullable MultipartHttpServletRequest files, ModelAndView mav) {
		int roomNo = 0;
		Attached file = new Attached();

		if (roomService.insertRoom(room) > 0) {
			roomNo = roomService.getLastRoomNo();
		}

		// 서버에서 저장 할 경로
		
		 String uploadFolder = "/var/lib/tomcat9/webapps/files/";
		//String uploadFolder = "C:\\Users\\bdahm\\Desktop\\stswork\\files";
		System.out.println(files);
		List<MultipartFile> list = files.getFiles("files");
		if (list.size() != 0) {

			for (int i = 0; i < list.size(); i++) {
				String fileRealName = list.get(i).getOriginalFilename();
				if (fileRealName.length() > 0) {
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

					// 랜덤한 이름으로 저장 (파일명 중복)
					UUID uuid = UUID.randomUUID();
					System.out.println(uuid.toString());
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];

					File saveFile = new File(uploadFolder + uniqueName + fileExtension);
					file.setRealTitle(fileRealName);
					file.setCateNo(roomNo);
					file.setCodeTitle(uniqueName + fileExtension);
					file.setCategory("ROOM");

					try {
						list.get(i).transferTo(saveFile);
						// file 테이블에 저장
						attachedService.insertFile(file);
						List<Room> list2 = roomService.getTotalRoomList();
						mav.addObject("list", list2);
						mav.setViewName("roomAdmin");
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();

					}
				}
			}
		}
		return mav;
	}

	@RequestMapping("/room/modify")
	public ModelAndView roomModify(ModelAndView mav, Room room, @Nullable MultipartHttpServletRequest files) {
		int roomNo = room.getRoomNo();
		Attached file = new Attached();

		roomService.update(room);
		 String uploadFolder = "/var/lib/tomcat9/webapps/files/";
		//String uploadFolder = "C:\\Users\\bdahm\\Desktop\\stswork\\files";
		List<MultipartFile> list = files.getFiles("files");
		
		if (list.size() > 0 && list.get(0).getSize() > 0) {
			// 기존에 등록된 파일 제거
			String existedFileName = attachedService.getFileName(roomNo);
			File existedFile = new File(uploadFolder + existedFileName);
			existedFile.delete();

			for (int i = 0; i < list.size(); i++) {
				String fileRealName = list.get(i).getOriginalFilename();
				if (fileRealName.length() > 0) {
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

					// 랜덤한 이름으로 저장 (파일명 중복)
					UUID uuid = UUID.randomUUID();
					System.out.println(uuid.toString());
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];

					File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
					file.setRealTitle(fileRealName);
					file.setCateNo(roomNo);
					file.setCodeTitle(uniqueName + fileExtension);
					file.setCategory("ROOM");

					try {
						list.get(i).transferTo(saveFile);
						attachedService.updateFile(roomNo, file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();

					}
				}
			}

		}

		List<Room> list2 = roomService.getTotalRoomList();
		mav.addObject("list", list2);
		mav.setViewName("roomAdmin");

		return mav;

	}

}