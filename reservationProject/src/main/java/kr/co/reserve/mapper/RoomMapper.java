
package kr.co.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.reserve.domain.Attached;
import kr.co.reserve.domain.Room;


public interface RoomMapper {

	
	// 룸 리스트 조회 쿼리 
	//@Select("select a.* from room a left join reservationdata b ON b.roomNo = a.roomNo where a.max >= #{max} AND(( b.checkInDate >= #{checkInDate}  AND b.checkOutDate <=  #{checkOutDate}) or b.checkOutDate is null);")
	//public List<Room> getAvailableRoom(@Param("checkInDate") String checkInDate, @Param("checkOutDate")String checkOutDate, @Param("max") int max);

	
	@Select("SELECT *FROM room WHERE roomNo NOT IN (SELECT DISTINCT roomNo  FROM reservationdata WHERE checkInDate < #{checkOutDate}   AND checkOutDate > #{checkInDate} AND status in(1,2,3)) AND max >= #{max} ")
	public List<Room> getAvailableRoom(@Param("checkInDate") String checkInDate, @Param("checkOutDate")String checkOutDate, @Param("max") int max);

	// 새로운 방 생성하는 쿼리 
	@Insert("Insert into pinestay.room (roomNo, roomType, price, max,created) values (#{room.roomNo},#{room.roomType},#{room.price}, #{room.max},now());") 
	public int insertRoom(@Param("room") Room room); 
	
	// 제일 최근 등록된 방 번호 구하는 쿼리 
	@Select("Select roomNo from pinestay.room ORDER BY created DESC LIMIT 1;")
	public int getLastRoomNo();    
	

	@Select("Select * from pinestay.room where roomNo = #{roomNo}")
	public Room getRoomInfo(int roomNo);

	@Select("select count(*) from room")
	public int getTotalRoom();

	@Select("Select * from room")
	public List<Room> getTotalRoomList();

	@Update("Update room set  max=#{room.max} , price =#{room.price} where roomNo = #{room.roomNo}")
	public int modify(@Param("room") Room room);
	
	
	
}