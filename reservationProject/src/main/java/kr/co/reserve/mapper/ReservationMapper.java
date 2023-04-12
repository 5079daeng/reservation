package kr.co.reserve.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.reserve.domain.Reservation;
import kr.co.reserve.domain.Room;

public interface ReservationMapper {

	@Insert("Insert into pinestay.Reservationdata (roomNo, checkInDate, checkOutDate, userCount, status, userNo, userId) values (#{Reservation.roomNo},#{Reservation.checkInDate},#{Reservation.checkOutDate},"
			+ "#{Reservation.userCount},1,#{Reservation.userNo},#{Reservaion.userId})")
	public int insertReservationDate(@Param("Reservation") Reservation Reservation);
	
	@Select("Select Max(reserveNo) from pinestay.Reservationdata")
	public int getLastReserveNo();
	
	@Insert("Insert into pinestay.Reservationdetail (reserveNo,adult, child, adultBf, childBf, price) values (#{reserveNo},#{adult},#{child},#{adultBf},#{childBf},#{price})")
	public int insertRsvDetail(@Param("reserveNo") int reserveNo,@Param("adult") int adult, @Param("child") int child, @Param("adultBf") int adultBf, @Param("childBf") int childBf, @Param("price") int price); 
	
	
	@Select("Select * from pinestay.Reservationdata where userNo = #{userNo}")
	public List<Reservation> getRsvList(@Param("userNo") int userNo);
    
	@Select("Select * from pinestay.Reservationdetail where reserveNo = #{reserveNo}")
	public HashMap<String, String> getRsvDetail(int reserveNo);

	@Select("Select * from reservationdata ORDER BY reserveNo desc;")
	public List<Reservation> getReservation();
    
	@Update("Update reservationdata set status = #{rsv.status} where reserveNo = #{rsv.reserveNo};")
	public int modify(@Param("rsv") Reservation rsv); 

}
