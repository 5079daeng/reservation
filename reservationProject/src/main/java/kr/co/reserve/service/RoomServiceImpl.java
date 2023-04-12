package kr.co.reserve.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.reserve.domain.Room;
import kr.co.reserve.mapper.RoomMapper;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	RoomMapper roomMapper;
	
	
    @Override
	public List<Room> getRoomList(String checkInDate, String checkOutDate, int max) {
		List<Room> list  = roomMapper.getAvailableRoom(checkInDate,checkOutDate,max);
		return list;
	}
	
    @Override
	public Room getRoomInfo(int roomNo) {
		Room room = roomMapper.getRoomInfo(roomNo); 
		return room;
	}

	@Override
	public int insertRoom(Room room) {
	return roomMapper.insertRoom(room);
	}

	@Override
	public int getLastRoomNo() {
	return roomMapper.getLastRoomNo();
	
	}


	@Override
	public int getTotalRoom() {
		return roomMapper.getTotalRoom();
	}

	@Override
	public List<Room> getTotalRoomList() {
		return roomMapper.getTotalRoomList();

	}

	@Override
	public int update(Room room) {
		
		return roomMapper.modify(room); 
	}

	
}