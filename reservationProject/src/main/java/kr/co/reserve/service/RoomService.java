package kr.co.reserve.service;

import java.util.List;
import org.springframework.stereotype.Service;

import kr.co.reserve.domain.Reservation;
import kr.co.reserve.domain.Room;


@Service
public interface RoomService  {
	
	List<Room> getRoomList(String checkInDate, String checkOutDate, int max);

	Room getRoomInfo(int roomNo);
	
	int insertRoom(Room room);
	
	int getLastRoomNo();

	int getTotalRoom();

	List<Room> getTotalRoomList();

	int update(Room room);

}
